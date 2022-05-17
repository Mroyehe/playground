import requests
import os

import config

from exceptions import APIKeyNotFound, ActionIsNone, HTTPNotFound, APIForbiddenOrNotFound


class APIFootball:

    def __init__(self, action=None):
        self.params = dict()
        self.__set_api_key()
        if not action:
            raise ActionIsNone
        self.params["action"] = action
        self.url = config.API_FOOTBALL_URL

    def __set_api_key(self):
        try:
            self.params["APIkey"] = config.API_KEY
        except AttributeError:
            self.params["APIkey"] = os.environ["API_FOOTBALL_KEY"]
        except KeyError:
            raise APIKeyNotFound

    def set_params(self):
        raise NotImplementedError

    def get(self):
        response = requests.get(url=self.url, params=self.params)
        if response.status_code != config.HTTP_OK:
            raise HTTPNotFound
        response = response.json()
        if config.API_ERROR in response or not response:
            print(f"JSON Response: {response}")
            raise APIForbiddenOrNotFound
        return response


class GetLeagues(APIFootball):
    ACTION = "get_leagues"

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)

    def set_params(self, **kwargs):
        self.params.update(kwargs)


if __name__ == '__main__':
    a = GetLeagues()
    r = a.get()
    print(r)

