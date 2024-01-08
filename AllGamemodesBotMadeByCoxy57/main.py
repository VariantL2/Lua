try:
    import secrets
    import discord
    from discord import app_commands
    import http.client, json
    import datetime, secrets, hashlib
    from sklearn.linear_model import LinearRegression, LogisticRegression
    from sklearn.model_selection import train_test_split
    import numpy as np
    from sklearn.dummy import DummyClassifier, DummyRegressor
    from sklearn.neighbors import KNeighborsClassifier, KNeighborsRegressor
    from sklearn.preprocessing import LabelEncoder
    from collections import defaultdict
    import os, sys
    import math
    import time
except Exception as e:
    import time, sys

    print(e)
    time.sleep(3)
    sys.exit(000)

## MADE BY coxy.57 with love from notris, blitzk & alex :) ##
## Enjoy this free predictor with 5 methods for each gamemode. ##


# made by coxy.57
# made by coxy.57
# made by coxy.57

# pre-defined settings & methods
# cooldown is in seconds, so 5 seconds is default

## MAKE SURE TO ENABLE ALL INTENTS FOR BOT ##

settings = {
    "cooldown": 5,
    "bot_token": "BOT_TOKEN_HERE",
    "auth_file": "accounts.json",
    "role_to_create_keys": "Owner",
    "predictorname": "PREDICTOR_NAME_HERE",
    "madeby": "coxy.57"
}

if os.path.isfile("./" + settings['auth_file']):
    pass
else:
    print('You need to create an json file because %s file does not exist in the directory.' % settings['auth_file'])
    sys.exit(000)

name = settings['madeby']

# predictor name will be included in ur key so like: predictornamehere-348dfu8sdfhjf

# ADDING NEW METHODS TO HERE WONT WORK UNLESS YOU MAKE IT WORK! #

crash_methods = {
    "LearnPatterns": "LearnPatterns",
    "Linear": "LinearRegression",
    "KNN": "KNearestNeighbors",
    "AdvancedAverage": "AdvancedAverage",
    "AdvancedMedian": "AdvancedMedian",
    "Mean": "Mean",
    "NotrisAlgorithm": "NotrisAlgorithm"
}

# made by coxy.57
# made by coxy.57
# made by coxy.57
slide_methods = {
    "LogisticRegression": "LogisticRegression",
    "AdvancedMarkov": "AdvancedMarkov",
    "CountAlgo": "CountAlgo",
    "FutureColor": "FutureColor",
}

mines_methods = {
    "PastGames": "PastGames",
    "Neighbors": "Neighbors",
    "SafeSearch": "SafeSearch",
    "Randomization": "Randomization",
}

tower_methods = {
    "PastGames": "PastGames",
    "NearestAdvanced": "NearestAdvanced",
    "RecentTrend": "RecentTrend",
    "Randomization": "Randomization",
    "BlitzkAlgorithm": "BlitzkAlgorithm"
}
# ADDING NEW METHODS TO HERE WONT WORK UNLESS YOU MAKE IT WORK! #
# pre-defined settings & methods

name = settings['madeby']

# DO NOT REMOVE THIS LINE or the code wont work
x = "coxy.57 made this"
x = "coxy.57 made this"
x = "coxy.57 made this"
x = "coxy.57 made this"

cooldown = settings['cooldown']
auth_file = settings['auth_file']


class aclient(discord.Client):
    def __init__(self):
        super().__init__(intents=discord.Intents.default())
        self.synced = False

    async def on_ready(self):
        await self.wait_until_ready()
        if not self.synced:
            await tree.sync()
            self.synced = True
        print(f"We have logged in as {self.user}.")


# made by coxy.57
# made by coxy.57
# made by coxy.57
client = aclient()
tree = app_commands.CommandTree(client)
x = "coxy.57 made this"

# made by coxy.57
# made by coxy.57
# made by coxy.57

# made by coxy.57
# made by coxy.57
# made by coxy.57
# -- CLASSES --

x = "coxy.57 made this"
x = "coxy.57 made this"

x = "coxy.57 made this"
x = "coxy.57 made this"

x = "coxy.57 made this"
x = "coxy.57 made this"


class coxy57:
    def __init__(self, coxy_57):
        self.coxy_57 = coxy_57

    def credits(self):
        print(self.coxy_57 + " made this!")

    @staticmethod
    def antiskid(pas):
        cc = "coxy.57 made this"
        eq = (pas + 5)
        ## MADE BY COXY57

    @staticmethod
    def helper(px):
        p = (px * 0.01)
        c = 'coxy'
        return c


class cl:
    @staticmethod
    def h():
        whomade = "coxy.57"
        return "coxy.57"


class unrigController:
    api_base = "api.bloxflip.com"
    headers = {
        "x-auth-token": "",
        "Referer": "https://bloxflip.com/",
        "Content-Type": "application/json",
        "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/117.0.5938.108 Mobile/15E148 Safari/604.1"
    }

    @staticmethod
    def unrig(auth, method):
        newhash = ""
        c = cl.h()
        headers = unrigController.headers.copy()
        headers["x-auth-token"] = str(auth).strip()
        conn = http.client.HTTPSConnection(unrigController.api_base)
        conn.request('GET', '/provably-fair', headers=headers)
        data = json.loads(conn.getresponse().read().decode())
        serverHash = data['serverHash']
        match method:
            case "MD5":
                newhash = hashlib.md5(serverHash.encode()).hexdigest()[:32]
            case "SHA256":
                newhash = hashlib.sha256(serverHash.encode()).hexdigest()[:32]
            case "CoxyAlgorithm":
                newhash = hashlib.sha512(serverHash.encode()).hexdigest()[:32]
        conn.request('POST', '/provably-fair/clientSeed', headers=headers, body=json.dumps({"clientSeed": newhash}))
        return json.loads(conn.getresponse().read())['success']


# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57
x = "coxy.57 made this"
u = coxy57.antiskid(10)


class CrashPredictor:
    def __init__(self):
        self.headers = {
            "x-auth-token": "",
            "Referer": "https://bloxflip.com/",
            "Content-Type": "application/json",
            "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/117.0.5938.108 Mobile/15E148 Safari/604.1"
        }

    def linear(self):
        c = coxy57.antiskid()
        games = self.grab_games()
        x = np.array(games).reshape(-1, 1)
        y = np.array(games)
        x_train, x_test, y_train, y_test = train_test_split(x, y, shuffle=False)
        l = LinearRegression()
        l.fit(x_train, y_train)
        return round(l.predict(x_test)[0], 2)

    def knn(self):
        games = self.grab_games()
        x = np.array(games).reshape(-1, 1)
        y = np.array(games)
        x_train, x_test, y_train, y_test = train_test_split(x, y, shuffle=False)
        l = KNeighborsRegressor(n_neighbors=3)
        l.fit(x_train, y_train)
        return round(l.predict(x_test)[0], 2)

    def learnpatterns(self):
        ## GRABS PAST GAMES AND TAKE AVERAGE ##
        games = self.grab_games()[:7]
        return round(sum(games) / len(games), 2)
        ## GRABS PAST GAMES AND TAKE AVERAGE ##

    def advmedian(self):
        games = self.grab_games()
        x = np.array(games).reshape(-1, 1)
        y = np.array(games)
        x_train, x_test, y_train, y_test = train_test_split(x, y, shuffle=False)
        l = DummyRegressor(strategy="median")
        l.fit(x_train, y_train)
        return round(l.predict(x_test)[0], 2)

    def advancedavg(self):
        games = self.grab_games()
        alp = 0.3
        game_len = len(games)
        ni = [alp * (1 - alp) ** i for i in range(game_len - 1, -1, -1)]
        adavg = sum(x * w for x, w in zip(games, ni)) / sum(ni)
        return round(adavg, 2)

    def notrisalgorithm(self):
        games = self.grab_games()
        base = 1.0
        n = len(games)

        for game in games:
            base *= game

        g = base ** (1 / n)
        return round(g, 2)

    def mean(self):
        games = self.grab_games()
        return round(sum(games) / len(games), 2)

    def grab_games(self):
        name = settings['madeby']
        conn = http.client.HTTPSConnection("api.bloxflip.com")
        conn.request("GET", "/games/crash", headers=self.headers)
        g = json.loads(conn.getresponse().read())
        return [x['crashPoint'] for x in g['history']]


# made by coxy.57
# made by coxy.57
# made by coxy.57
class SlidePredictor:
    def __init__(self):
        self.headers = {
            "Referer": "https://bloxflip.com/",
            "Content-Type": "application/json",
            "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/117.0.5938.108 Mobile/15E148 Safari/604.1"
        }

    def logistic(self):
        games = self.grab_games()
        label = LabelEncoder()
        new_g = label.fit_transform(games)
        x = np.arange(len(games)).reshape(-1, 1)
        y = np.array(new_g)
        x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.5, train_size=0.5, shuffle=False)
        l = LogisticRegression(
            fit_intercept=False,
            solver="liblinear"
        )
        l.fit(x_train, y_train)
        pred = l.predict(x_test)
        return label.inverse_transform(pred)[-1]

    def futurecolor(self):
        org = self.grab_games()
        return org[-1]

    def advmarkov(self):
        colors = self.grab_games()
        model = defaultdict(dict)
        probs = defaultdict(float)
        l = len(colors)

        for i in range(len(colors) - 1):
            current = colors[i]
            n = colors[i + 1]

            if n not in model[current]:
                model[current][n] = 1
            else:
                model[current][n] += 1

        for cc, value in model.items():
            total_t = sum(value.values())
            for nc in value:
                model[cc][nc] /= total_t
        for color in colors:
            probs[color] += 1
        for color in probs:
            probs[color] /= l

        pred = max(probs, key=probs.get)
        return pred

    def countalgo(self):
        games = self.grab_games()[:6]
        g = {"red": games.count("red"), "purple": games.count("purple"), "yellow": games.count("yellow")}
        return max(g, key=g.get)

    def grab_games(self):
        conn = http.client.HTTPSConnection("api.bloxflip.com")
        conn.request("GET", "/games/roulette", headers=self.headers)
        g = json.loads(conn.getresponse().read())
        return [x['winningColor'] for x in g['history']]


class TowersPredictor:
    def __init__(self, auth):
        self.conn = http.client.HTTPSConnection("api.bloxflip.com")
        self.auth = auth
        self.headers = {
            "x-auth-token": str(auth).strip(),
            "Referer": "https://bloxflip.com/",
            "Content-Type": "application/x-www-form-urlencoded",
            "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/117.0.5938.108 Mobile/15E148 Safari/604.1"
        }
        self.made_by = ['coxy.57']

    def check_game(self):
        self.conn.request("GET", "/games/towers", headers=self.headers)
        h = json.loads(self.conn.getresponse().read().decode())
        if h['hasGame']:
            return h
        else:
            return False

    def randomization(self):
        if not self.check_game():
            return "*Currently not in game.*\n"
        board = [
            [0] * 3 for i in range(8)
        ]
        for i in range(len(board)):
            board[i][np.random.randint(0, 3)] = 1
        board = ["✅" if row == 1 else "❌" for x in board for row in x]
        return "\n".join("".join(map(str, board[x:x + 3])) for x in range(0, len(board), 3))

    def nearestadv(self):
        if not self.check_game():
            return "*Currently not in game.*\n"
        games = self.get_games(size=1)
        counter = []
        for v in range(len(games) - 1):
            obj = [0] * 3
            l_new = games[v + 1].index(1)
            fi = games[v].index(1) + l_new
            f = min(fi, 2)
            obj[f] = 1
            counter.append(obj)
        counter.append(games[7])
        board = ["✅" if row == 1 else "❌" for x in counter for row in x]
        return "\n".join("".join(map(str, board[x:x + 3])) for x in range(0, len(board), 3))

    def pastgames(self):
        if not self.check_game():
            return "*Currently not in game.*\n"
        board = self.get_games(size=1)
        board = ["✅" if row == 1 else "❌" for x in board for row in x]
        return "\n".join("".join(map(str, board[x:x + 3])) for x in range(0, len(board), 3))

    def blitzalgorithm(self):
        if not self.check_game():
            return "*Currently not in game.*\n"
        board = self.get_games(size=1)
        b = []
        for v in board:
            x = v.index(0)
            new_x = abs(v.index(1) - x)
            n = [0] * 3
            n[new_x] = 1
            b.append(n)
        board = ["✅" if row == 1 else "❌" for x in board for row in x]
        return "\n".join("".join(map(str, board[x:x + 3])) for x in range(0, len(board), 3))

    def recentTrend(self):
        if not self.check_game():
            return "*Currently not in game.*\n"
        games = self.get_games(size=3, cat=True)
        c = {
            "new_board_hf": {}
        }
        for v in games:
            for i, value in enumerate(v):
                if int(i) in c['new_board_hf'].keys():
                    if sum(1 for x in c['new_board_hf'][i] if x >= 1) == 2:
                        pass
                    else:
                        c['new_board_hf'][i][value.index(1)] += 1
                else:
                    c['new_board_hf'][i] = [0] * 3
        conv = [n for v in c['new_board_hf'].values() for n in v]
        board = ["✅" if x >= 1 else "❌" for x in conv]
        return "\n".join("".join(map(str, board[x:x + 3])) for x in range(0, len(board), 3))

    def get_games(self, size, cat=False):
        self.conn.request("GET", f"/games/towers/history?size={size}&page=0", headers=self.headers)
        history = json.loads(self.conn.getresponse().read().decode())['data']
        towerLevels = [row for x in history for row in x['towerLevels']] if not cat else [x['towerLevels'] for x in
                                                                                          history]
        return towerLevels


# made by coxy.57
# made by coxy.57
# made by coxy.57
class MinesPredictor:
    def __init__(self, auth, tiles):
        self.conn = http.client.HTTPSConnection("api.bloxflip.com")
        self.max_tiles = tiles
        self.headers = {
            "x-auth-token": str(auth).strip(),
            "Referer": "https://bloxflip.com/",
            "Content-Type": "application/x-www-form-urlencoded",
            "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/117.0.5938.108 Mobile/15E148 Safari/604.1"
        }
        self.made_by = ['coxy.57']
        self.mines = 1

    def get_highest_tile(self, tiles):
        cac = {x: tiles.count(x) for x in tiles}
        n = []
        for i in range(self.max_tiles):
            if cac[tiles[i]] >= 3:
                n.append(tiles[i] + 1)
            else:
                n.append(tiles[i])
        c = "coxy.57 made this"
        e = sorted(cac, key=lambda x: cac[x])[:self.max_tiles]
        return n

    def get_accuracy(self, board_c):
        board = [0] * 25
        for i, v in enumerate(board):
            if i in board_c:
                board[i] = 1
        n = (sum(board) + 3) / len(board) * 100
        return 100 - n

    def create_board(self, board_c):
        board = [0] * 25
        for i, v in enumerate(board):
            if i in board_c:
                board[i] = 1
        board = ["✅" if x == 1 else "💣" for x in board]
        return "\n".join("".join(map(str, board[i:i + 5])) for i in range(0, len(board), 5))

    def tile_setup(self):
        self.conn.request("GET", "/games/mines/history?size=24&page=0", headers=self.headers)
        history = json.loads(self.conn.getresponse().read().decode())['data']
        history = [row for x in history for row in x['mineLocations']]
        tiles = self.get_highest_tile(history)
        return tiles

    def is_neighbor(self, pos1: int, pos2: int) -> bool:
        row1, col1 = divmod(pos1, 5)
        row2, col2 = divmod(pos2, 5)
        distance = math.sqrt((row2 - row1) ** 2 + (col2 - col1) ** 2)
        return False if distance >= 1 else True

    def n_spawn(self):
        self.conn.request("GET", "/games/mines/history?size=24&page=0", headers=self.headers)
        history = json.loads(self.conn.getresponse().read().decode())['data']
        x = [row for x in history for row in x['mineLocations']]
        maxv = 0
        board = [0] * 25
        for ind in range(25):
            if not self.is_neighbor(x[ind], x[max(ind + 1, 24)]) and maxv < self.max_tiles:
                board[x[ind]] = 1
                maxv += 1
            elif maxv >= self.max_tiles:
                break
            else:
                pass
        accuracy = self.get_accuracy(board)
        board = ["✅" if x == 1 else "💣" for x in board]
        return "\n".join("".join(map(str, board[i:i + 5])) for i in range(0, len(board), 5)), accuracy

    def check_game(self):
        self.conn.request("GET", "/games/mines", headers=self.headers)
        h = json.loads(self.conn.getresponse().read().decode())
        if h['hasGame']:
            self.mines = h['game']['minesAmount']
            return h
        else:
            return False

    def randomization(self):
        board = [0] * 25
        a = 0
        while a < self.max_tiles:
            c = np.random.randint(0, 25)
            if board[c] == 1:
                continue
            else:
                a += 1
                board[np.random.randint(0, 25)] = 1
        accuracy = self.get_accuracy(board)
        board = ["✅" if x == 1 else "💣" for x in board]
        return "\n".join("".join(map(str, board[i:i + 5])) for i in range(0, len(board), 5)), accuracy

    def safesearch(self):
        if not self.check_game():
            return "*Currently not in game.*\n", ""
        board = [0] * 25
        self.conn.request("GET", "/games/mines/history?size=24&page=0", headers=self.headers)
        history = json.loads(self.conn.getresponse().read().decode())['data']
        history = [row for x in history for row in x['mineLocations']]
        x = 0
        for v in range(len(history) - 1):
            if x < self.max_tiles:
                h = min(abs(history[v] - history[v + 1]) + (history[v] - v), 24)
                board[h] = 1
                x += 1
            else:
                break

        accuracy = self.get_accuracy(board)
        board = ["✅" if x == 1 else "💣" for x in board]
        return "\n".join("".join(map(str, board[i:i + 5])) for i in range(0, len(board), 5)), accuracy

    def pastgames(self):
        if not self.check_game():
            return "*Currently not in game.*\n", ""
        t = self.tile_setup()
        accuracy = self.get_accuracy(t)
        x = self.create_board(t)
        return x, accuracy

    def neighbors(self):
        if not self.check_game():
            return "*Currently not in game.*\n", ""
        n_s = self.n_spawn()
        return n_s


# -- CLASSES  END --

# -- MAIN FUNCTIONS --


# made by coxy.57
# made by coxy.57
# made by coxy.57


# made by coxy.57
# made by coxy.57
# made by coxy.57

# made by coxy.57
# made by coxy.57
# made by coxy.57
def game_active(gamemode):
    match gamemode:
        case "crash":
            conn = http.client.HTTPSConnection("api.bloxflip.com")
            headers = {
                "Referer": "https://bloxflip.com/",
                "Content-Type": "application/x-www-form-urlencoded",
                "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/117.0.5938.108 Mobile/15E148 Safari/604.1"
            }
            conn.request("GET", url="/games/crash", headers=headers)
            return True if json.loads(conn.getresponse().read().decode())['current']['status'] != 2 else False
        case "slide":
            conn = http.client.HTTPSConnection("api.bloxflip.com")
            headers = {
                "Referer": "https://bloxflip.com/",
                "Content-Type": "application/x-www-form-urlencoded",
                "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/117.0.5938.108 Mobile/15E148 Safari/604.1"
            }
            conn.request("GET", url="/games/roulette", headers=headers)
            return False if json.loads(conn.getresponse().read().decode())['current']['joinable'] else True


# made by coxy.57
# made by coxy.57
# made by coxy.57

def coxy57():
    r = "coxy.57"
    e = (10 * 10 + 2) / 2
    return "coxy.57 made this script"


def getProfile(auth):
    coxy57()
    c = "coxy.57"
    conn = http.client.HTTPSConnection("api.bloxflip.com")
    headers = {
        "x-auth-token": auth,
        "Referer": "https://bloxflip.com/",
        "Content-Type": "application/x-www-form-urlencoded",
        "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/117.0.5938.108 Mobile/15E148 Safari/604.1"
    }
    conn.request("GET", url="/user", headers=headers)
    return json.loads(conn.getresponse().read().decode())


def validToken(auth):
    c = "coxy.57"
    conn = http.client.HTTPSConnection("api.bloxflip.com")
    headers = {
        "x-auth-token": auth,
        "Referer": "https://bloxflip.com/",
        "Content-Type": "application/x-www-form-urlencoded",
        "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/117.0.5938.108 Mobile/15E148 Safari/604.1"
    }
    conn.request("GET", url="/user", headers=headers)
    return json.loads(conn.getresponse().read().decode())['success']


# made by coxy.57
# made by coxy.57
# made by coxy.57

# made by coxy.57
# made by coxy.57
# made by coxy.57


# made by coxy.57
# made by coxy.57
# made by coxy.57


# made by coxy.57
# made by coxy.57
# made by coxy.57
def gentime(length):
    coxy = "coxy.57"
    match length:
        case "Lifetime":
            return datetime.datetime.now() + datetime.timedelta(weeks=100000)
        case "Monthly":
            return datetime.datetime.now() + datetime.timedelta(weeks=4)
        case "Weekly":
            return datetime.datetime.now() + datetime.timedelta(weeks=4)
        case "Daily":
            return datetime.datetime.now() + datetime.timedelta(days=1)


# made by coxy.57
# made by coxy.57
# made by coxy.57
def checkauth(id):
    c = "coxy.57"
    coxy = "coxy.57"
    authf = json.load(open(auth_file, 'r'))
    v = list(authf.values())
    v = [v['user_id'] for v in v]
    if id in v:
        getkey = list(authf.keys())[v.index(id)]
        expires = datetime.datetime.strptime(authf[getkey]['expires'], '%Y-%m-%d %H:%M:%S.%f')
        if expires <= datetime.datetime.now():
            return {"valid": False, "reason": "exp"}
        else:
            auth = authf[getkey].get('auth_token')
            return {"valid": True, "token": auth} if auth else {"valid": False, "reason": "NOLINK"}
    else:
        return {"valid": False, "reason": "NO_KEY_EXIST"}


# -- MAIN FUNCTIONS --
# -- ERROR HANDLING --

@tree.error
async def on_command_error(interaction, error):
    if isinstance(error, app_commands.MissingRole):
        e = discord.Embed(title="Missing Role",
                          description=f"You are missing the {error.missing_role} role to execute this command.",
                          color=discord.Color.red())
        await interaction.response.send_message(embed=e, ephemeral=True)
    elif isinstance(error, app_commands.CommandOnCooldown):
        e = discord.Embed(title="Cooldown",
                          description=f"Please wait {round(error.retry_after, 2)} seconds until trying this command again.",
                          color=discord.Color.red())
        await interaction.response.send_message(embed=e, ephemeral=True)
    else:
        e = discord.Embed(title="Error Occured",
                          description=f"An error has occured: {error}",
                          color=discord.Color.red())
        await interaction.response.send_message(embed=e, ephemeral=True)


# -- ERROR HANDLING --
# made by coxy.57
# made by coxy.57
# made by coxy.57
@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="credits", description="Sees who made the bot.")
async def credits(interaction: discord.Interaction):
    m = "Coxy.57"
    if m != "Coxy.57":
        e = discord.Embed(title="Bot Credits",
                          description=f"**Main Developer**: Coxy.57\n**Helpers**: Notris, Bitzk & Alex\n**Testers**: Sinful, Rouie & Ranger",
                          color=discord.Color.green())
        await interaction.response.send_message(embed=e)
    else:
        e = discord.Embed(title="Bot Credits",
                          description=f"**Main Developer**: {m}\n**Helpers**: Notris, Bitzk & Alex\n**Testers**: Sinful, Rouie & Ranger",
                          color=discord.Color.green())
        await interaction.response.send_message(embed=e)


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="checkuser", description="Checks if a user has a key.")
@app_commands.checks.has_role(settings['role_to_create_keys'])
async def checkuser(interaction: discord.Interaction, member: discord.Member):
    x = json.load(open(auth_file, 'r'))
    get_users = [x['user_id'] for x in x.values()]
    if member.id in get_users:
        key = list(x.keys())[get_users.index(member.id)]
        e = discord.Embed(title="User Fetched", description=f"{member.mention}'s Information\n\n**Key**: {key}",
                          color=discord.Color.green())
        await interaction.response.send_message(embed=e, ephemeral=True)
    else:
        e = discord.Embed(title="User Fetched Error", description=f"{member.mention} does not have a key.",
                          color=discord.Color.red())
        await interaction.response.send_message(embed=e, ephemeral=True)


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="createkey", description="Add a new key to the database.")
@app_commands.choices(length=[
    discord.app_commands.Choice(name="Lifetime", value="Lifetime"),
    discord.app_commands.Choice(name="Monthly", value="Monthly"),
    discord.app_commands.Choice(name="Weekly", value="Weekly"),
    discord.app_commands.Choice(name="Daily", value="Daily")
])
@app_commands.checks.has_role(settings['role_to_create_keys'])
async def createkey(interaction: discord.Interaction, length: str):
    time = gentime(length)
    predictorname = settings['predictorname']
    key_creation = f"{predictorname}" + "-" + secrets.token_hex(10)
    with open(auth_file, 'r') as f:
        j = json.load(f)
        j[key_creation] = {"user_id": None, "auth_token": None, "expires": str(time)}
    with open(auth_file, 'w') as b:
        json.dump(j, b, indent=4)
    e = discord.Embed(title="Key Creation", description=f"**Key**: {key_creation}\n**Expires**: {length}",
                      color=discord.Color.green())
    await interaction.response.send_message(embed=e, ephemeral=True)


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="deletekey", description="Delete a key from the database.")
@app_commands.checks.has_role(settings['role_to_create_keys'])
async def deletekey(interaction: discord.Interaction, key: str):
    x = json.load(open(auth_file, 'r'))
    if x.get(key):
        # pop key from json file
        x.pop(key)
        with open(auth_file, 'w') as f:
            json.dump(x, f, indent=4)
        e = discord.Embed(title="Key Removed", description="You have successfully removed this key!",
                          color=discord.Color.green())
        await interaction.response.send_message(embed=e, ephemeral=True)
    else:
        e = discord.Embed(title="Key Error", description="Key does not exist.", color=discord.Color.red())
        await interaction.response.send_message(embed=e, ephemeral=True)


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="redeem", description="Reedems your key and adds it to the database.")
async def redeem(interaction: discord.Interaction, key: str):
    keys = json.load(open(auth_file, 'r'))
    if keys.get(key) and not keys[key]['user_id']:
        with open(auth_file, 'r') as f:
            j = json.load(f)
            j[key].update({"user_id": interaction.user.id})
        with open(auth_file, 'w') as b:
            json.dump(j, b, indent=4)
        e = discord.Embed(title="Key Redeemed", description="You have successfully redeemed the key!",
                          color=discord.Color.green())
        await interaction.response.send_message(embed=e)
    elif keys.get(key) and keys[key]['user_id']:
        e = discord.Embed(title="Key Error", description="Key has already been redeemed!", color=discord.Color.red())
        await interaction.response.send_message(embed=e)
    else:
        e = discord.Embed(title="Key Error", description="Invalid key!", color=discord.Color.red())
        await interaction.response.send_message(embed=e)


# made by coxy.57
# made by coxy.57
# made by coxy.57

# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57

@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="howtogettoken", description="Explains to you how to get your bloxflip token.")
async def howtogettoken(interaction: discord.Interaction):
    # thx to nebula for this || :) -coxy57
    linkacc = (
        "Here's a quick tutorial on how to link your account!\n\n"

        "• Start by heading\n"
        "over to the BloxFlip site and navigate to the console\n\n"

        "[Ctrl] + [Shift] + [I]\n\n"

        "• Head over to\n"
        "the last last line of the console and paste the following prompt:\n"
        "copy(localStorage.getItem('_DO_NOT_SHARE_BLOXFLIP_TOKEN'));\n\n"

        "• Finally Execute this command:\n"
        "/link auth: your-auth-token\n\n"
    )

    e = discord.Embed(
        title="",
        description=linkacc,
        color=discord.Color.blue()
    )
    e.set_footer(text=f"Made by coxy.57", icon_url=interaction.user.avatar)
    await interaction.response.send_message(embed=e)


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="profile", description="View your bloxflip statistics.")
async def profile(interaction: discord.Interaction):
    auth_token = checkauth(interaction.user.id)
    if auth_token['valid']:
        g = getProfile(auth_token['token'])
        ## GENERATE EMBED ##
        robloxid = g['user']['robloxId']
        robloxusername = g['user']['robloxUsername']
        balance = round(g['user']['wallet'], 3)
        wager = round(g['user']['wager'], 2)
        e = discord.Embed(title="Profile Statistics", description=
        f"**ID**: {robloxid}\n**User**: {robloxusername}\n**Balance**: {balance}\n**Wager**: {wager:,}",
                          color=discord.Color.green())
        e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        await interaction.response.send_message(embed=e)
    else:
        m = (
            "Your key has expired" if auth_token['reason'] == "exp"
            else "You must link your account first with /link" if auth_token['reason'] == "NOLINK"
            else "You don't have a key"
        )
        await interaction.response.send_message(
            embed=discord.Embed(
                title="Profile Statistics",
                description=m,
                color=discord.Color.red()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="unlink", description="Unlink your bloxflip account from the bot.")
async def unlink(interaction: discord.Interaction):
    auth_token = checkauth(interaction.user.id)
    if auth_token['valid']:
        x = json.load(open(auth_file, 'r'))
        e = [x['user_id'] for x in x.values()]
        getkey = list(x.keys())[e.index(interaction.user.id)]
        x[getkey]['auth_token'] = ""
        with open(auth_file, 'w') as n:
            json.dump(x, n, indent=4)
        await interaction.response.send_message(
            embed=discord.Embed(
                title="Account Unlink",
                description="Your account has been unlinked successfully. Do /link to relink",
                color=discord.Color.green()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )
    else:
        m = (
            "Your key has expired" if auth_token['reason'] == "exp"
            else "You must link your account first with /link" if auth_token['reason'] == "NOLINK"
            else "You don't have a key"
        )
        await interaction.response.send_message(
            embed=discord.Embed(
                title="Account link",
                description=m,
                color=discord.Color.red()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="settings", description="Check your current settings.")
async def settings_cmd(interaction: discord.Interaction):
    auth_token = checkauth(interaction.user.id)
    if auth_token['valid']:
        x = json.load(open(auth_file, 'r'))
        y = [x['auth_token'] for x in x.values()]
        e = y.index(auth_token['token'])
        key = list(x.keys())[e]
        get_data_key = x[str(key)]
        exp_data = datetime.datetime.strptime(get_data_key['expires'], '%Y-%m-%d %H:%M:%S.%f')
        expire = exp_data - datetime.datetime.now()
        embed = discord.Embed(title="Account Settings", description=f"**Key**: {key}\n**Expires**: {expire.days} Days",
                              color=discord.Color.green())
        embed.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        await interaction.response.send_message(embed=embed, ephemeral=True)
    else:
        m = (
            "Your key has expired" if auth_token['reason'] == "exp"
            else "You must link your account first with /link" if auth_token['reason'] == "NOLINK"
            else "You don't have a key"
        )
        await interaction.response.send_message(
            embed=discord.Embed(
                title="Account Settings",
                description=m,
                color=discord.Color.red()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="link", description="Link your bloxflip token to the bot.")
async def link(interaction: discord.Interaction, auth: str):
    x = json.load(open(auth_file, 'r'))
    v = list(x.values())
    v = [v['user_id'] for v in v]
    if validToken(auth):
        if interaction.user.id in v:
            getkey = list(x.keys())[v.index(interaction.user.id)]
            if not x[getkey]['auth_token']:
                with open(auth_file, 'r') as f:
                    j = json.load(f)
                    j[getkey].update({"auth_token": auth})
                with open(auth_file, 'w') as f:
                    json.dump(j, f, indent=4)
                e = discord.Embed(title="Auth Token", description="Successfully set your auth token!",
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e, ephemeral=True)
            else:
                e = discord.Embed(title="Auth Token", description="Token is already in file!",
                                  color=discord.Color.red())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e, ephemeral=True)
        else:
            e = discord.Embed(title="Auth Token", description="You need to redeem a key before doing this command!",
                              color=discord.Color.red())
            e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
            await interaction.response.send_message(embed=e, ephemeral=True)
    else:
        e = discord.Embed(title="Auth token", description="Auth token is invalid!", color=discord.Color.red())
        e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        await interaction.response.send_message(embed=e, ephemeral=True)


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@app_commands.choices(method=[
    app_commands.Choice(name=key, value=value) for key, value in tower_methods.items()
])
@tree.command(name="towers", description="Predicts your current towers game.")
async def towers(interaction: discord.Interaction, method: str):
    auth_token = checkauth(interaction.user.id)
    if auth_token['valid']:
        auth_token = auth_token['token']
        match method:
            case "NearestAdvanced":
                l = TowersPredictor(auth_token)
                prediction = l.nearestadv()
                e = discord.Embed(title="Towers Prediction", description="%s\n**Method**: %s" % (prediction, method),
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "RecentTrend":
                l = TowersPredictor(auth_token)
                prediction = l.recentTrend()
                e = discord.Embed(title="Towers Prediction", description="%s\n**Method**: %s" % (prediction, method),
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "Randomization":
                l = TowersPredictor(auth_token)
                prediction = l.randomization()
                e = discord.Embed(title="Towers Prediction", description="%s\n**Method**: %s" % (prediction, method),
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "PastGames":
                l = TowersPredictor(auth_token)
                prediction = l.pastgames()
                e = discord.Embed(title="Towers Prediction", description="%s\n**Method**: %s" % (prediction, method),
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "BlitzkAlgorithm":
                l = TowersPredictor(auth_token)
                prediction = l.blitzalgorithm()
                e = discord.Embed(title="Towers Prediction", description="%s\n**Method**: %s" % (prediction, method),
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case _:
                e = discord.Embed(title="Towers Prediction", description="An error has occured!",
                                  color=discord.Color.red())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
    else:
        m = (
            "Your key has expired" if auth_token['reason'] == "exp"
            else "You must link your account first with /link" if auth_token['reason'] == "NOLINK"
            else "You don't have a key"
        )
        await interaction.response.send_message(
            embed=discord.Embed(
                title="Mines Predictor",
                description=m,
                color=discord.Color.red()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@app_commands.choices(method=[
    app_commands.Choice(name=key, value=value) for key, value in mines_methods.items()
])
@tree.command(name="mines", description="Predicts your current mines game.")
async def mines(interaction: discord.Interaction, method: str, tiles: int):
    auth_token = checkauth(interaction.user.id)
    if not 0 < tiles < 25:
        return await interaction.response.send_message(
            embed=discord.Embed(
                title="Mines Predictor",
                description="The tile amount must be between 1 and 24 tiles.",
                color=discord.Color.red()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )
    if auth_token['valid']:
        auth_token = auth_token['token']
        match method:
            case "PastGames":
                l = MinesPredictor(auth_token, tiles)
                prediction, accuracy = l.pastgames()
                e = discord.Embed(title="Mines Predictor",
                                  description="%s\n**Accuracy**: %s\n**Method**: %s" % (prediction, accuracy, method),
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "SafeSearch":
                l = MinesPredictor(auth_token, tiles)
                prediction, accuracy = l.safesearch()
                e = discord.Embed(title="Mines Predictor",
                                  description="%s\n**Accuracy**: %s\n**Method**: %s" % (prediction, accuracy, method),
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "Neighbors":
                l = MinesPredictor(auth_token, tiles)
                prediction, accuracy = l.neighbors()
                e = discord.Embed(title="Mines Predictor",
                                  description="%s\n**Accuracy**: %s\n**Method**: %s" % (prediction, accuracy, method),
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "Randomization":
                l = MinesPredictor(auth_token,tiles)
                prediction, accuracy = l.randomization()
                e = discord.Embed(title="Mines Predictor",
                                  description="%s\n**Accuracy**: %s\n**Method**: %s" % (prediction, accuracy, method),
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case _:
                e = discord.Embed(title="Mines Prediction", description="An error has occured!",
                                  color=discord.Color.red())
                await interaction.response.send_message(embed=e)
    else:
        m = (
            "Your key has expired" if auth_token['reason'] == "exp"
            else "You must link your account first with /link" if auth_token['reason'] == "NOLINK"
            else "You don't have a key"
        )
        await interaction.response.send_message(
            embed=discord.Embed(
                title="Mines Predictor",
                description=m,
                color=discord.Color.red()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="crash", description="Predict current crash games.")
@app_commands.choices(method=[
    app_commands.Choice(name=key, value=value) for key, value in crash_methods.items()
])
async def crash(interaction, method: str):
    auth_token = checkauth(interaction.user.id)
    if auth_token['valid']:
        if game_active("crash"):
            e = discord.Embed(title="Crash Prediction", description="A game is in progress, wait until next one.",
                              color=discord.Color.red())
            return await interaction.response.send_message(embed=e)
        match method:
            case "LinearRegression":
                l = CrashPredictor()
                prediction = l.linear()
                e = discord.Embed(title="Crash Prediction", description="**Predicted Crash Point**: %s" % prediction,
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "KNearestNeighbors":
                l = CrashPredictor()
                prediction = l.knn()
                e = discord.Embed(title="Crash Prediction", description="**Predicted Crash Point**: %s" % prediction,
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "AdvancedAverage":
                l = CrashPredictor()
                prediction = l.advancedavg()
                e = discord.Embed(title="Crash Prediction", description="**Predicted Crash Point**: %s" % prediction,
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "NotrisAlgorithm":
                l = CrashPredictor()
                prediction = l.notrisalgorithm()
                e = discord.Embed(title="Crash Prediction", description="**Predicted Crash Point**: %s" % prediction,
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "AdvancedMedian":
                l = CrashPredictor()
                prediction = l.advmedian()
                e = discord.Embed(title="Crash Prediction", description="**Predicted Crash Point**: %s" % prediction,
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "LearnPatterns":
                l = CrashPredictor()
                prediction = l.learnpatterns()
                e = discord.Embed(title="Crash Prediction", description="**Predicted Crash Point**: %s" % prediction,
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case "Mean":
                l = CrashPredictor()
                prediction = l.mean()
                e = discord.Embed(title="Crash Prediction", description="**Predicted Crash Point**: %s" % prediction,
                                  color=discord.Color.green())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
            case _:
                e = discord.Embed(title="Crash Prediction", description="An error has occured!",
                                  color=discord.Color.red())
                e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
                await interaction.response.send_message(embed=e)
    else:
        m = (
            "Your key has expired" if auth_token['reason'] == "exp"
            else "You must link your account first with /link" if auth_token['reason'] == "NOLINK"
            else "You don't have a key"
        )
        await interaction.response.send_message(
            embed=discord.Embed(
                title="Mines Predictor",
                description=m,
                color=discord.Color.red()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="slide", description="Predict current slide games.")
@app_commands.choices(method=[
    app_commands.Choice(name=key, value=value) for key, value in slide_methods.items()
])
async def slide(interaction, method: str):
    auth_token = checkauth(interaction.user.id)
    if auth_token['valid']:
        if game_active("slide"):
            e = discord.Embed(title="Slide Prediction", description="A game is in progress, wait until next one.",
                              color=discord.Color.red())
            return await interaction.response.send_message(embed=e)
        match method:
            case "LogisticRegression":
                l = SlidePredictor()
                prediction = l.logistic()
                e = discord.Embed(title="Slide Prediction", description="**Predicted Color**: %s" % prediction,
                                  color=discord.Color.green())
                await interaction.response.send_message(embed=e)
            case "AdvancedMarkov":
                l = SlidePredictor()
                prediction = l.advmarkov()
                e = discord.Embed(title="Slide Prediction", description="**Predicted Color**: %s" % prediction,
                                  color=discord.Color.green())
                await interaction.response.send_message(embed=e)
            case "CountAlgo":
                l = SlidePredictor()
                prediction = l.countalgo()
                e = discord.Embed(title="Slide Prediction", description="**Predicted Color**: %s" % prediction,
                                  color=discord.Color.green())
                await interaction.response.send_message(embed=e)
            case "FutureColor":
                l = SlidePredictor()
                prediction = l.futurecolor()
                e = discord.Embed(title="Slide Prediction", description="**Predicted Color**: %s" % prediction,
                                  color=discord.Color.green())
                await interaction.response.send_message(embed=e)
            case "CoxyAlgorithm":
                pass
            case _:
                e = discord.Embed(title="Crash Prediction", description="An error has occured!",
                                  color=discord.Color.red())
                await interaction.response.send_message(embed=e)
    else:
        m = (
            "Your key has expired" if auth_token['reason'] == "exp"
            else "You must link your account first with /link" if auth_token['reason'] == "NOLINK"
            else "You don't have a key"
        )
        await interaction.response.send_message(
            embed=discord.Embed(
                title="Mines Predictor",
                description=m,
                color=discord.Color.red()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )


@app_commands.checks.cooldown(1, cooldown, key=lambda i: (i.guild_id, i.user.id))
@tree.command(name="unrig", description="Attemps to unrig your bloxflip account.")
@app_commands.choices(method=[
    app_commands.Choice(name="MD5", value="MD5"),
    app_commands.Choice(name="SHA256", value="SHA256"),
    app_commands.Choice(name="CoxyUnrig", value="CoxyUnrig")
])
async def unrig(interaction: discord.Interaction, method: str):
    auth_token = checkauth(interaction.user.id)
    if auth_token['valid'] and unrigController.unrig(auth_token['token'], method):
        e = discord.Embed(title="Unrig Command", description="Successfully unrigged your account.",
                          color=discord.Color.green())
        e.set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        await interaction.response.send_message(embed=e)
    else:
        m = (
            "Your key has expired" if auth_token['reason'] == "exp"
            else "You must link your account first with /link" if auth_token['reason'] == "NOLINK"
            else "You don't have a key"
        )
        await interaction.response.send_message(
            embed=discord.Embed(
                title="Mines Predictor",
                description=m,
                color=discord.Color.red()
            ).set_footer(text="Made by coxy.57", icon_url=interaction.user.avatar)
        )


client.run(settings["bot_token"])

# made by coxy.57
# made by coxy.57
# made by coxy.57
# made by coxy.57