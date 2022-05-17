import requests
import os

import config

from exceptions import APIKeyNotFound, ActionIsNone, HTTPNotFound, APIForbiddenOrNotFound, APIMandatoryParameters


class APIFootball:
    OPTIONAL_PARAMS = []
    MANDATORY_PARAMS = []
    NUM_OF_MANDATORY = 0

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

    def __set_list_params(self, list_params, **kwargs):
        for param in list_params:
            if param in kwargs:
                self.params.update({param: kwargs[param]})

    def set_params(self, **kwargs):
        if len([param for param in self.MANDATORY_PARAMS if param in kwargs]) < self.NUM_OF_MANDATORY:
            raise APIMandatoryParameters
        self.__set_list_params(self.OPTIONAL_PARAMS, **kwargs)
        self.__set_list_params(self.MANDATORY_PARAMS, **kwargs)

    def get(self):
        response = requests.get(url=self.url, params=self.params)
        if response.status_code != config.HTTP_OK:
            raise HTTPNotFound
        response = response.json()
        if config.API_ERROR in response or not response:
            print(f"JSON Response: {response}")
            raise APIForbiddenOrNotFound
        return response


class Countries(APIFootball):
    ACTION = "get_countries"

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class Competitions(APIFootball):
    ACTION = "get_leagues"
    OPTIONAL_PARAMS = ["country_id"]

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class Teams(APIFootball):
    ACTION = "get_teams"
    MANDATORY_PARAMS = ["team_id", "league_id"]
    NUM_OF_MANDATORY = 1

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class Players(APIFootball):
    ACTION = "get_players"
    MANDATORY_PARAMS = ["player_id", "player_name"]
    NUM_OF_MANDATORY = 1

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)
        print(self.params)


class Standings(APIFootball):
    ACTION = "get_standings"
    MANDATORY_PARAMS = ["league_id"]
    NUM_OF_MANDATORY = 1

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class Events(APIFootball):
    """
    from - Start date (yyyy-mm-dd)
    to -   Stop date (yyyy-mm-dd)
    """
    ACTION = "get_events"
    OPTIONAL_PARAMS = ["timezone", "country_id", "league_id", "match_id", "team_id"]
    MANDATORY_PARAMS = ["from", "to"]
    NUM_OF_MANDATORY = 2

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class Lineups(APIFootball):
    ACTION = "get_lineups"
    MANDATORY_PARAMS = ["match_id"]
    NUM_OF_MANDATORY = 1

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class Statistics(APIFootball):
    ACTION = "get_lineups"
    MANDATORY_PARAMS = ["match_id"]
    NUM_OF_MANDATORY = 1

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class Odds(APIFootball):
    """
    from - Start date (yyyy-mm-dd)
    to -   Stop date (yyyy-mm-dd)
    """
    ACTION = "get_odds"
    OPTIONAL_PARAMS = ["match_id"]
    MANDATORY_PARAMS = ["from", "to"]
    NUM_OF_MANDATORY = 2

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class LiveOddsComments(APIFootball):
    ACTION = "get_live_odds_commnets"
    OPTIONAL_PARAMS = ["country_id", "league_id", "match_id"]

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class H2H(APIFootball):
    ACTION = "get_H2H"
    OPTIONAL_PARAMS = ["timezone"]
    MANDATORY_PARAMS = ["firstTeam", "secondTeam", "firstTeamId", "secondTeamId"]
    NUM_OF_MANDATORY = 2

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class Predictions(APIFootball):
    """
    from - Start date (yyyy-mm-dd)
    to -   Stop date (yyyy-mm-dd)
    """
    ACTION = "get_predictions"
    OPTIONAL_PARAMS = ["country_id", "league_id", "match_id"]
    MANDATORY_PARAMS = ["from", "to"]
    NUM_OF_MANDATORY = 2

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


class TopScorers(APIFootball):
    ACTION = "get_topscorers"
    MANDATORY_PARAMS = ["league_id"]
    NUM_OF_MANDATORY = 1

    def __init__(self, **kwargs):
        super().__init__(self.ACTION)
        self.set_params(**kwargs)


if __name__ == '__main__':
    a = LiveOddsComments()
    # r = a.get()
    # print(r)

