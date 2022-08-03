// This is a HEAVILY modified version of Kento's RankMe
// https://github.com/rogeraabbccdd/Kento-Rankme

#include <get5>
#include <ripext>

#pragma semicolon 1
#pragma newdecls required

enum struct WEAPONS_ENUM {
	int KNIFE;
	int GLOCK;
	int HKP2000;
	int USP_SILENCER;
	int P250;
	int DEAGLE;
	int ELITE;
	int FIVESEVEN;
	int TEC9;
	int CZ75A;
	int REVOLVER;
	int NOVA;
	int XM1014;
	int MAG7;
	int SAWEDOFF;
	int BIZON;
	int MAC10;
	int MP9;
	int MP7;
	int UMP45;
	int P90;
	int GALILAR;
	int AK47;
	int SCAR20;
	int FAMAS;
	int M4A1;
	int M4A1_SILENCER;
	int AUG;
	int SSG08;
	int SG556;
	int AWP;
	int G3SG1;
	int M249;
	int NEGEV;
	int HEGRENADE;
	int FLASHBANG;
	int SMOKEGRENADE;
	int	INFERNO;
	int DECOY;
	int TASER;
	int MP5SD;
	int BREACHCHARGE;

	void Reset() {
		this.KNIFE = 0;
		this.GLOCK = 0;
		this.HKP2000 = 0;
		this.USP_SILENCER = 0;
		this.P250 = 0;
		this.DEAGLE = 0;
		this.ELITE = 0;
		this.FIVESEVEN = 0;
		this.TEC9 = 0;
		this.CZ75A = 0;
		this.REVOLVER = 0;
		this.NOVA = 0;
		this.XM1014 = 0;
		this.MAG7 = 0;
		this.SAWEDOFF = 0;
		this.BIZON = 0;
		this.MAC10 = 0;
		this.MP9 = 0;
		this.MP7 = 0;
		this.UMP45 = 0;
		this.P90 = 0;
		this.GALILAR = 0;
		this.AK47 = 0;
		this.SCAR20 = 0;
		this.FAMAS = 0;
		this.M4A1 = 0;
		this.M4A1_SILENCER = 0;
		this.AUG = 0;
		this.SSG08 = 0;
		this.SG556 = 0;
		this.AWP = 0;
		this.G3SG1 = 0;
		this.M249 = 0;
		this.NEGEV = 0;
		this.HEGRENADE = 0;
		this.FLASHBANG = 0;
		this.SMOKEGRENADE = 0;
		this.INFERNO = 0;
		this.DECOY = 0;
		this.TASER = 0;
		this.MP5SD = 0;
		this.BREACHCHARGE = 0;
	}
}

enum struct STATS_NAMES	{
	int SCORE;
	int KILLS;
	int DEATHS;
	int ASSISTS;
	int SUICIDES;
	int TK;
	int SHOTS;
	int HITS;
	int HEADSHOTS;
	int CONNECTED;
	int ROUNDS_TR;
	int ROUNDS_CT;
	int C4_PLANTED;
	int C4_EXPLODED;
	int C4_DEFUSED;
	int CT_WIN;
	int TR_WIN;
	int HOSTAGES_RESCUED;
	int VIP_KILLED;
	int VIP_ESCAPED;
	int VIP_PLAYED;
	int MVP;
	int DAMAGE;
	int MATCH_WIN;
	int MATCH_DRAW;
	int MATCH_LOSE;
	int FB;
	int NS;
	int NSD;

	void Reset() {
		this.KILLS = 0;
		this.DEATHS = 0;
		this.ASSISTS = 0;
		this.SUICIDES = 0;
		this.TK = 0;
		this.SHOTS = 0;
		this.HITS = 0;
		this.HEADSHOTS = 0;
		this.CONNECTED = 0;
		this.ROUNDS_TR = 0;
		this.ROUNDS_CT = 0;
		this.C4_PLANTED = 0;
		this.C4_EXPLODED = 0;
		this.C4_DEFUSED = 0;
		this.CT_WIN = 0;
		this.TR_WIN = 0;
		this.HOSTAGES_RESCUED = 0;
		this.VIP_KILLED = 0;
		this.VIP_ESCAPED = 0;
		this.VIP_PLAYED = 0;
		this.MVP = 0;
		this.DAMAGE = 0;
		this.MATCH_WIN = 0;
		this.MATCH_DRAW = 0;
		this.MATCH_LOSE = 0;
		this.FB = 0;
		this.NS = 0;
		this.NSD = 0;
	}
}

enum struct HITBOXES {
	int NULL_HITBOX;
	int HEAD;
	int CHEST;
	int STOMACH;
	int LEFT_ARM;
	int RIGHT_ARM;
	int LEFT_LEG;
	int RIGHT_LEG;

	void Reset() {
		this.NULL_HITBOX = 0;
		this.HEAD = 0;
		this.CHEST = 0;
		this.STOMACH = 0;
		this.LEFT_ARM = 0;
		this.RIGHT_ARM = 0;
		this.LEFT_LEG = 0;
		this.RIGHT_LEG = 0;
	}
}

stock const char g_sWeaponsNamesGame[42][] =  { "knife", "glock", "hkp2000", "usp_silencer", "p250", "deagle", "elite", "fiveseven", "tec9", "cz75a", "revolver", "nova", "xm1014", "mag7", "sawedoff", "bizon", "mac10", "mp9", "mp7", "ump45", "p90", "galilar", "ak47", "scar20", "famas", "m4a1", "m4a1_silencer", "aug", "ssg08", "sg556", "awp", "g3sg1", "m249", "negev", "hegrenade", "flashbang", "smokegrenade", "inferno", "decoy", "taser", "mp5sd", "breachcharge"};

STATS_NAMES g_aStats[MAXPLAYERS + 1];
WEAPONS_ENUM g_aWeapons[MAXPLAYERS + 1];
HITBOXES g_aHitBox[MAXPLAYERS + 1];

ConVar g_cvarEnabled;
ConVar g_cvarPointsBombDefusedTeam;
ConVar g_cvarPointsBombDefusedPlayer;
ConVar g_cvarPointsBombPlantedTeam;
ConVar g_cvarPointsBombPlantedPlayer;
ConVar g_cvarPointsBombExplodeTeam;
ConVar g_cvarPointsBombExplodePlayer;
ConVar g_cvarPointsBombPickup;
ConVar g_cvarPointsBombDropped;
ConVar g_cvarPointsHostageRescTeam;
ConVar g_cvarPointsHostageRescPlayer;
ConVar g_cvarPointsVipEscapedTeam;
ConVar g_cvarPointsVipEscapedPlayer;
ConVar g_cvarPointsVipKilledTeam;
ConVar g_cvarPointsVipKilledPlayer;
ConVar g_cvarPointsHs;
ConVar g_cvarPointsKillCt;
ConVar g_cvarPointsKillTr;
ConVar g_cvarPointsKillBonusCt;
ConVar g_cvarPointsKillBonusTr;
ConVar g_cvarPointsKillBonusDifCt;
ConVar g_cvarPointsKillBonusDifTr;
ConVar g_cvarPointsStart;
ConVar g_cvarPointsKnifeMultiplier;
ConVar g_cvarPointsTaserMultiplier;
ConVar g_cvarPointsTrRoundWin;
ConVar g_cvarPointsCtRoundWin;
ConVar g_cvarPointsTrRoundLose;
ConVar g_cvarPointsCtRoundLose;
ConVar g_cvarPointsMvpCt;
ConVar g_cvarPointsMvpTr;
ConVar g_cvarPercentPointsLose;
ConVar g_cvarPointsLoseRoundCeil;
ConVar g_cvarVipEnabled;
ConVar g_cvarPointsLoseTk;
ConVar g_cvarPointsLoseSuicide;
ConVar g_cvarFfa;
ConVar g_cvarPointsMatchWin;
ConVar g_cvarPointsMatchDraw;
ConVar g_cvarPointsMatchLose;
ConVar g_cvarPointsAssistKill;
ConVar g_cvarPointsMinEnabled;
ConVar g_cvarPointsFb;
ConVar g_cvarPointsNS;
ConVar g_cvarNSAllSnipers;
ConVar g_cvarPointsMin;
ConVar g_cvarAPIURL;
ConVar g_cvarSeason;

bool g_bEnabled;
bool g_bPointsLoseRoundCeil;
bool g_bFfa;
bool g_bNSAllSnipers;
bool g_bPointsMinEnabled;
bool firstblood = false;

char g_sAPIURL[128];

float g_fPointsKnifeMultiplier;
float g_fPointsTaserMultiplier;
float g_fPercentPointsLose;

int g_PointsBombDefusedTeam;
int g_PointsBombDefusedPlayer;
int g_PointsBombPlantedTeam;
int g_PointsBombPlantedPlayer;
int g_PointsBombExplodeTeam;
int g_PointsBombExplodePlayer;
int g_PointsBombPickup;
int g_PointsBombDropped;
int g_PointsHostageRescTeam;
int g_PointsHostageRescPlayer;
int g_PointsHs;
int g_PointsKill[4]; // The size is 4 for using client team for points
int g_PointsKillBonus[4];
int g_PointsKillBonusDif[4];
int g_PointsMvpTr;
int g_PointsMvpCt;
int g_PointsRoundWin[4];
int g_PointsRoundLose[4];
int g_PointsLoseTk;
int g_PointsLoseSuicide;
int g_PointsVipEscapedTeam;
int g_PointsVipEscapedPlayer;
int g_PointsVipKilledTeam;
int g_PointsVipKilledPlayer;
int g_PointsMatchWin;
int g_PointsMatchDraw;
int g_PointsMatchLose;
int g_PointsAssistKill;
int g_PointsMin;
int g_PointsFb;
int g_PointsNS;
int connectedTime[MAXPLAYERS + 1];
int g_TotalPlayers;
int g_C4PlantedBy;
int g_iSeasonId;

#define TR 2
#define CT 3
#define GAMEUNITS_TO_METERS	0.01905

public Plugin myinfo = {
	name = "[G5] Ranking",
	author = "Kento, B3none, TheBO$$",
	description = "G5 ranking plugin.",
	version = "1.1.0",
	url = "https://github.com/csgo-league"
};

public void OnPluginStart() {
	CreateCvars();

	AddCvarListeners();

	// Events
	HookEventEx("player_death", Event_PlayerDeath);
	HookEventEx("player_hurt", Event_PlayerHurt);
	HookEventEx("weapon_fire", Event_WeaponFire);
	HookEventEx("bomb_planted", Event_BombPlanted);
	HookEventEx("bomb_defused", Event_BombDefused);
	HookEventEx("bomb_exploded", Event_BombExploded);
	HookEventEx("bomb_dropped", Event_BombDropped);
	HookEventEx("bomb_pickup", Event_BombPickup);
	HookEventEx("hostage_rescued", Event_HostageRescued);
	HookEventEx("vip_killed", Event_VipKilled);
	HookEventEx("vip_escaped", Event_VipEscaped);
	HookEventEx("round_end", Event_RoundEnd);
	HookEventEx("round_start", Event_RoundStart);
	HookEventEx("round_mvp", Event_RoundMVP);

	// Load g5.ranking.cfg
	AutoExecConfig(true, "g5_ranking");
}

void CreateCvars() {
    g_cvarEnabled = CreateConVar("g5_ranking_enabled", "1", "Is ranking enabled? 1 = true 0 = false", _, true, 0.0, true, 1.0);
    g_cvarPointsBombDefusedTeam = CreateConVar("g5_ranking_points_bomb_defused_team", "2", "How many points CTs got for defusing the C4?", _, true, 0.0);
    g_cvarPointsBombDefusedPlayer = CreateConVar("g5_ranking_points_bomb_defused_player", "2", "How many points the CT who defused got additional?", _, true, 0.0);
    g_cvarPointsBombPlantedTeam = CreateConVar("g5_ranking_points_bomb_planted_team", "2", "How many points TRs got for planting the C4?", _, true, 0.0);
    g_cvarPointsBombPlantedPlayer = CreateConVar("g5_ranking_points_bomb_planted_player", "2", "How many points the TR who planted got additional?", _, true, 0.0);
    g_cvarPointsBombExplodeTeam = CreateConVar("g5_ranking_points_bomb_exploded_team", "2", "How many points TRs got for exploding the C4?", _, true, 0.0);
    g_cvarPointsBombExplodePlayer = CreateConVar("g5_ranking_points_bomb_exploded_player", "2", "How many points the TR who planted got additional?", _, true, 0.0);
    g_cvarPointsHostageRescTeam = CreateConVar("g5_ranking_points_hostage_rescued_team", "2", "How many points CTs got for rescuing the hostage?", _, true, 0.0);
    g_cvarPointsHostageRescPlayer = CreateConVar("g5_ranking_points_hostage_rescued_player", "2", "How many points the CT who rescued got additional?", _, true, 0.0);
    g_cvarPointsHs = CreateConVar("g5_ranking_points_hs", "1", "How many additional points a player got for a HeadShot?", _, true, 0.0);
    g_cvarPointsKillCt = CreateConVar("g5_ranking_points_kill_ct", "2", "How many points a CT got for killing?", _, true, 0.0);
    g_cvarPointsKillTr = CreateConVar("g5_ranking_points_kill_tr", "2", "How many points a TR got for killing?", _, true, 0.0);
    g_cvarPointsKillBonusCt = CreateConVar("g5_ranking_points_kill_bonus_ct", "1", "How many points a CT got for killing additional by the difference of points?", _, true, 0.0);
    g_cvarPointsKillBonusTr = CreateConVar("g5_ranking_points_kill_bonus_tr", "1", "How many points a TR got for killing additional by the difference of points?", _, true, 0.0);
    g_cvarPointsKillBonusDifCt = CreateConVar("g5_ranking_points_kill_bonus_dif_ct", "100", "How many points of difference is needed for a CT to got the bonus?", _, true, 0.0);
    g_cvarPointsKillBonusDifTr = CreateConVar("g5_ranking_points_kill_bonus_dif_tr", "100", "How many points of difference is needed for a TR to got the bonus?", _, true, 0.0);
    g_cvarPointsCtRoundWin = CreateConVar("g5_ranking_points_ct_round_win", "0", "How many points CT got for winning the round?", _, true, 0.0);
    g_cvarPointsTrRoundWin = CreateConVar("g5_ranking_points_tr_round_win", "0", "How many points TR got for winning the round?", _, true, 0.0);
    g_cvarPointsCtRoundLose = CreateConVar("g5_ranking_points_ct_round_lose", "0", "How many points CT lost for losing the round?", _, true, 0.0);
    g_cvarPointsTrRoundLose = CreateConVar("g5_ranking_points_tr_round_lose", "0", "How many points TR lost for losing the round?", _, true, 0.0);
    g_cvarPointsKnifeMultiplier = CreateConVar("g5_ranking_points_knife_multiplier", "2.0", "Multiplier of points by knife", _, true, 0.0);
    g_cvarPointsTaserMultiplier = CreateConVar("g5_ranking_points_taser_multiplier", "2.0", "Multiplier of points by taser", _, true, 0.0);
    g_cvarPointsStart = CreateConVar("g5_ranking_points_start", "1000", "Starting points", _, true, 0.0);
    g_cvarPercentPointsLose = CreateConVar("g5_ranking_percent_points_lose", "1.0", "Multiplier of losing points. (WARNING: MAKE SURE TO INPUT IT AS FLOAT) 1.0 equals lose same amount as won by the killer, 0.0 equals no lose", _, true, 0.0);
    g_cvarPointsLoseRoundCeil = CreateConVar("g5_ranking_points_lose_round_ceil", "1", "If the points is f1oat, round it to next the highest or lowest? 1 = highest 0 = lowest", _, true, 0.0, true, 1.0);
    g_cvarVipEnabled = CreateConVar("g5_ranking_vip_enabled", "0", "Show AS_ maps statistics (VIP mod) on statsme and session?", _, true, 0.0, true, 1.0);
    g_cvarPointsVipEscapedTeam = CreateConVar("g5_ranking_points_vip_escaped_team", "2", "How many points CTs got helping the VIP to escaping?", _, true, 0.0);
    g_cvarPointsVipEscapedPlayer = CreateConVar("g5_ranking_points_vip_escaped_player", "2", "How many points the VIP got for escaping?", _, true, 0.0);
    g_cvarPointsVipKilledTeam = CreateConVar("g5_ranking_points_vip_killed_team", "2", "How many points TRs got for killing the VIP?", _, true, 0.0);
    g_cvarPointsVipKilledPlayer = CreateConVar("g5_ranking_points_vip_killed_player", "2", "How many points the TR who killed the VIP got additional?", _, true, 0.0);
    g_cvarPointsLoseTk = CreateConVar("g5_ranking_points_lose_tk", "0", "How many points a player lose for Team Killing?", _, true, 0.0);
    g_cvarPointsLoseSuicide = CreateConVar("g5_ranking_points_lose_suicide", "0", "How many points a player lose for Suiciding?", _, true, 0.0);
    g_cvarPointsFb = CreateConVar("g5_ranking_points_fb", "1", "How many additional points a player got for a First Blood?", _, true, 0.0);
    g_cvarPointsNS = CreateConVar("g5_ranking_points_ns", "1", "How many additional points a player got for a no scope kill?", _, true, 0.0);
    g_cvarNSAllSnipers = CreateConVar("g5_ranking_points_ns_allsnipers", "0", "0: ssg08 and awp only, 1: ssg08, awp, g3sg1, scar20", _, true, 0.0, true, 1.0);
    g_cvarFfa = CreateConVar("g5_ranking_ffa", "0", "Free-For-All (FFA) mode? 1 = true 0 = false", _, true, 0.0, true, 1.0);
    g_cvarPointsMvpCt = CreateConVar("g5_ranking_points_mvp_ct", "1", "How many points a CT got for being the MVP?", _, true, 0.0);
    g_cvarPointsMvpTr = CreateConVar("g5_ranking_points_mvp_tr", "1", "How many points a TR got for being the MVP?", _, true, 0.0);
    g_cvarPointsBombPickup = CreateConVar("g5_ranking_points_bomb_pickup", "0", "How many points a player gets for picking up the bomb?", _, true, 0.0);
    g_cvarPointsBombDropped = CreateConVar("g5_ranking_points_bomb_dropped", "0", "How many points a player loess for dropping the bomb?", _, true, 0.0);
    g_cvarPointsMatchWin = CreateConVar("g5_ranking_points_match_win", "2", "How many points a player win for winning the match?", _, true, 0.0);
    g_cvarPointsMatchLose = CreateConVar("g5_ranking_points_match_lose", "2", "How many points a player loess for losing the match?", _, true, 0.0);
    g_cvarPointsMatchDraw = CreateConVar("g5_ranking_points_match_draw", "0", "How many points a player win when match draw?", _, true, 0.0);
    g_cvarPointsAssistKill = CreateConVar("g5_ranking_points_assist_kill","1","How many points a player gets for assist kill?",_,true,0.0);
    g_cvarPointsMinEnabled = CreateConVar("g5_ranking_points_min_enabled", "1", "Is minimum points enabled? 1 = true 0 = false", _, true, 0.0, true, 1.0);
	g_cvarPointsMin = CreateConVar("g5_ranking_points_min", "0", "Minimum points", _, true, 0.0);
	g_cvarSeason = CreateConVar("g5_ranking_season_id","","season id",_,true,0.0);
	g_cvarAPIURL = CreateConVar("g5_ranking_api_url","","G5 API URL",_,true,_,true,_);
}

void AddCvarListeners() {
	g_cvarEnabled.AddChangeHook(OnConVarChanged);
	g_cvarPointsBombDefusedTeam.AddChangeHook(OnConVarChanged);
	g_cvarPointsBombDefusedPlayer.AddChangeHook(OnConVarChanged);
	g_cvarPointsBombPlantedTeam.AddChangeHook(OnConVarChanged);
	g_cvarPointsBombPlantedPlayer.AddChangeHook(OnConVarChanged);
	g_cvarPointsBombExplodeTeam.AddChangeHook(OnConVarChanged);
	g_cvarPointsBombExplodePlayer.AddChangeHook(OnConVarChanged);
	g_cvarPointsHostageRescTeam.AddChangeHook(OnConVarChanged);
	g_cvarPointsHostageRescPlayer.AddChangeHook(OnConVarChanged);
	g_cvarPointsHs.AddChangeHook(OnConVarChanged);
	g_cvarPointsKillCt.AddChangeHook(OnConVarChanged);
	g_cvarPointsKillTr.AddChangeHook(OnConVarChanged);
	g_cvarPointsKillBonusCt.AddChangeHook(OnConVarChanged);
	g_cvarPointsKillBonusTr.AddChangeHook(OnConVarChanged);
	g_cvarPointsKillBonusDifCt.AddChangeHook(OnConVarChanged);
	g_cvarPointsKillBonusDifTr.AddChangeHook(OnConVarChanged);
	g_cvarPointsCtRoundWin.AddChangeHook(OnConVarChanged);
	g_cvarPointsTrRoundWin.AddChangeHook(OnConVarChanged);
	g_cvarPointsCtRoundLose.AddChangeHook(OnConVarChanged);
	g_cvarPointsTrRoundLose.AddChangeHook(OnConVarChanged);
	g_cvarPointsKnifeMultiplier.AddChangeHook(OnConVarChanged);
	g_cvarPointsTaserMultiplier.AddChangeHook(OnConVarChanged);
	g_cvarPointsStart.AddChangeHook(OnConVarChanged);
	g_cvarPercentPointsLose.AddChangeHook(OnConVarChanged);
	g_cvarPointsLoseRoundCeil.AddChangeHook(OnConVarChanged);
	g_cvarVipEnabled.AddChangeHook(OnConVarChanged);
	g_cvarPointsVipEscapedTeam.AddChangeHook(OnConVarChanged);
	g_cvarPointsVipEscapedPlayer.AddChangeHook(OnConVarChanged);
	g_cvarPointsVipKilledTeam.AddChangeHook(OnConVarChanged);
	g_cvarPointsVipKilledPlayer.AddChangeHook(OnConVarChanged);
	g_cvarPointsLoseTk.AddChangeHook(OnConVarChanged);
	g_cvarPointsLoseSuicide.AddChangeHook(OnConVarChanged);
	g_cvarFfa.AddChangeHook(OnConVarChanged);
	g_cvarPointsMvpCt.AddChangeHook(OnConVarChanged);
	g_cvarPointsMvpTr.AddChangeHook(OnConVarChanged);
	g_cvarPointsBombPickup.AddChangeHook(OnConVarChanged);
	g_cvarPointsBombDropped.AddChangeHook(OnConVarChanged);
	g_cvarPointsMatchWin.AddChangeHook(OnConVarChanged);
	g_cvarPointsMatchDraw.AddChangeHook(OnConVarChanged);
	g_cvarPointsMatchLose.AddChangeHook(OnConVarChanged);
	g_cvarPointsFb.AddChangeHook(OnConVarChanged);
	g_cvarPointsNS.AddChangeHook(OnConVarChanged);
	g_cvarNSAllSnipers.AddChangeHook(OnConVarChanged);
	g_cvarPointsAssistKill.AddChangeHook(OnConVarChanged);
	g_cvarPointsMinEnabled.AddChangeHook(OnConVarChanged);
	g_cvarPointsMin.AddChangeHook(OnConVarChanged);
	g_cvarSeason.AddChangeHook(OnConVarChanged);
	g_cvarAPIURL.AddChangeHook(OnConVarChanged);
}

public void OnConVarChanged(Handle convar, const char[] oldValue, const char[] newValue) {
	if (convar == g_cvarEnabled) {
		g_bEnabled = g_cvarEnabled.BoolValue;
	} else if (convar == g_cvarFfa) {
		g_bFfa = g_cvarFfa.BoolValue;
	} else if (convar == g_cvarPointsBombDefusedTeam) {
		g_PointsBombDefusedTeam = g_cvarPointsBombDefusedTeam.IntValue;
	} else if (convar == g_cvarPointsBombDefusedPlayer) {
		g_PointsBombDefusedPlayer = g_cvarPointsBombDefusedPlayer.IntValue;
	} else if (convar == g_cvarPointsBombPlantedTeam) {
		g_PointsBombPlantedTeam = g_cvarPointsBombPlantedTeam.IntValue;
	} else if (convar == g_cvarPointsBombPlantedPlayer) {
		g_PointsBombPlantedPlayer = g_cvarPointsBombPlantedPlayer.IntValue;
	} else if (convar == g_cvarPointsBombExplodeTeam) {
		g_PointsBombExplodeTeam = g_cvarPointsBombExplodeTeam.IntValue;
	} else if (convar == g_cvarPointsBombExplodePlayer) {
		g_PointsBombExplodePlayer = g_cvarPointsBombExplodePlayer.IntValue;
	} else if (convar == g_cvarPointsHostageRescTeam) {
		g_PointsHostageRescTeam = g_cvarPointsHostageRescTeam.IntValue;
	} else if (convar == g_cvarPointsHostageRescPlayer) {
		g_PointsHostageRescPlayer = g_cvarPointsHostageRescPlayer.IntValue;
	} else if (convar == g_cvarPointsHs) {
		g_PointsHs = g_cvarPointsHs.IntValue;
	} else if (convar == g_cvarPointsKillCt) {
		g_PointsKill[CT] = g_cvarPointsKillCt.IntValue;
	} else if (convar == g_cvarPointsKillTr) {
		g_PointsKill[TR] = g_cvarPointsKillTr.IntValue;
	} else if (convar == g_cvarPointsKillBonusCt) {
		g_PointsKillBonus[CT] = g_cvarPointsKillBonusCt.IntValue;
	} else if (convar == g_cvarPointsKillBonusTr) {
		g_PointsKillBonus[TR] = g_cvarPointsKillBonusTr.IntValue;
	} else if (convar == g_cvarPointsKillBonusDifCt) {
		g_PointsKillBonusDif[CT] = g_cvarPointsKillBonusDifCt.IntValue;
	} else if (convar == g_cvarPointsKillBonusDifTr) {
		g_PointsKillBonusDif[TR] = g_cvarPointsKillBonusDifTr.IntValue;
	} else if (convar == g_cvarPointsKnifeMultiplier) {
		g_fPointsKnifeMultiplier = g_cvarPointsKnifeMultiplier.FloatValue;
	} else if (convar == g_cvarPointsTaserMultiplier) {
		g_fPointsTaserMultiplier = g_cvarPointsTaserMultiplier.FloatValue;
	} else if (convar == g_cvarPointsTrRoundWin) {
		g_PointsRoundWin[TR] = g_cvarPointsTrRoundWin.IntValue;
	} else if (convar == g_cvarPointsCtRoundWin) {
		g_PointsRoundWin[CT] = g_cvarPointsCtRoundWin.IntValue;
	} else if (convar == g_cvarPointsTrRoundLose) {
		g_PointsRoundLose[TR] = g_cvarPointsTrRoundLose.IntValue;
	} else if (convar == g_cvarPointsCtRoundLose) {
		g_PointsRoundLose[CT] = g_cvarPointsCtRoundLose.IntValue;
	} else if (convar == g_cvarPercentPointsLose) {
		g_fPercentPointsLose = g_cvarPercentPointsLose.FloatValue;
	} else if (convar == g_cvarPointsLoseRoundCeil) {
		g_bPointsLoseRoundCeil = g_cvarPointsLoseRoundCeil.BoolValue;
	} else if (convar == g_cvarPointsVipEscapedTeam) {
		g_PointsVipEscapedTeam = g_cvarPointsVipEscapedTeam.IntValue;
	} else if (convar == g_cvarPointsVipEscapedPlayer) {
		g_PointsVipEscapedPlayer = g_cvarPointsVipEscapedPlayer.IntValue;
	} else if (convar == g_cvarPointsVipKilledTeam) {
		g_PointsVipKilledTeam = g_cvarPointsVipKilledTeam.IntValue;
	} else if (convar == g_cvarPointsVipKilledPlayer) {
		g_PointsVipKilledPlayer = g_cvarPointsVipKilledPlayer.IntValue;
	} else if (convar == g_cvarPointsMvpCt) {
		g_PointsMvpCt = g_cvarPointsMvpCt.IntValue;
	} else if (convar == g_cvarPointsMvpTr) {
		g_PointsMvpTr = g_cvarPointsMvpTr.IntValue;
	} else if (convar == g_cvarPointsBombPickup) {
		g_PointsBombDropped = g_cvarPointsBombPickup.IntValue;
	} else if (convar == g_cvarPointsBombDropped) {
		g_PointsBombDropped = g_cvarPointsBombDropped.IntValue;
	} else if (convar == g_cvarPointsAssistKill) {
		g_PointsAssistKill = g_cvarPointsAssistKill.IntValue;
	} else if (convar == g_cvarPointsMin) {
		g_PointsMin = g_cvarPointsMin.IntValue;
	} else if (convar == g_cvarPointsMinEnabled) {
		g_bPointsMinEnabled = g_cvarPointsMinEnabled.BoolValue;
	} else if (convar == g_cvarPointsMatchWin) {
		g_PointsMatchWin = g_cvarPointsMatchWin.IntValue;
	} else if (convar == g_cvarPointsMatchDraw) {
		g_PointsMatchDraw = g_cvarPointsMatchDraw.IntValue;
	} else if (convar == g_cvarPointsMatchLose) {
		g_PointsMatchLose = g_cvarPointsMatchLose.IntValue;
	} else if (convar == g_cvarPointsFb) {
		g_PointsFb = g_cvarPointsFb.IntValue;
	} else if (convar == g_cvarPointsNS) {
		g_PointsNS = g_cvarPointsNS.IntValue;
	} else if (convar == g_cvarNSAllSnipers) {
		g_bNSAllSnipers = g_cvarNSAllSnipers.BoolValue;
	} else if (convar == g_cvarSeason) {
		g_iSeasonId = g_cvarSeason.IntValue;
	} else if (convar == g_cvarAPIURL) {
		g_cvarAPIURL.GetString(g_sAPIURL, sizeof(g_sAPIURL));
	}
}

public void OnConfigsExecuted() {
	g_bEnabled = g_cvarEnabled.BoolValue;
	g_bFfa = g_cvarFfa.BoolValue;
	g_PointsBombDefusedTeam = g_cvarPointsBombDefusedTeam.IntValue;
	g_PointsBombDefusedPlayer = g_cvarPointsBombDefusedPlayer.IntValue;
	g_PointsBombPlantedTeam = g_cvarPointsBombPlantedTeam.IntValue;
	g_PointsBombPlantedPlayer = g_cvarPointsBombPlantedPlayer.IntValue;
	g_PointsBombExplodeTeam = g_cvarPointsBombExplodeTeam.IntValue;
	g_PointsBombExplodePlayer = g_cvarPointsBombExplodePlayer.IntValue;
	g_PointsHostageRescTeam = g_cvarPointsHostageRescTeam.IntValue;
	g_PointsHostageRescPlayer = g_cvarPointsHostageRescPlayer.IntValue;
	g_PointsHs = g_cvarPointsHs.IntValue;
	g_PointsKill[CT] = g_cvarPointsKillCt.IntValue;
	g_PointsKill[TR] = g_cvarPointsKillTr.IntValue;
	g_PointsKillBonus[CT] = g_cvarPointsKillBonusCt.IntValue;
	g_PointsKillBonus[TR] = g_cvarPointsKillBonusTr.IntValue;
	g_PointsKillBonusDif[CT] = g_cvarPointsKillBonusDifCt.IntValue;
	g_PointsKillBonusDif[TR] = g_cvarPointsKillBonusDifTr.IntValue;
	g_fPointsKnifeMultiplier = g_cvarPointsKnifeMultiplier.FloatValue;
	g_fPointsTaserMultiplier = g_cvarPointsTaserMultiplier.FloatValue;
	g_PointsRoundWin[TR] = g_cvarPointsTrRoundWin.IntValue;
	g_PointsRoundWin[CT] = g_cvarPointsCtRoundWin.IntValue;
	g_PointsRoundLose[TR] = g_cvarPointsTrRoundLose.IntValue;
	g_PointsRoundLose[CT] = g_cvarPointsCtRoundLose.IntValue;
	g_fPercentPointsLose = g_cvarPercentPointsLose.FloatValue;
	g_bPointsLoseRoundCeil = g_cvarPointsLoseRoundCeil.BoolValue;
	g_PointsVipEscapedTeam = g_cvarPointsVipEscapedTeam.IntValue;
	g_PointsVipEscapedPlayer = g_cvarPointsVipEscapedPlayer.IntValue;
	g_PointsVipKilledTeam = g_cvarPointsVipKilledTeam.IntValue;
	g_PointsVipKilledPlayer = g_cvarPointsVipKilledPlayer.IntValue;
	g_PointsLoseTk = g_cvarPointsLoseTk.IntValue;
	g_PointsLoseSuicide = g_cvarPointsLoseSuicide.IntValue;
	g_PointsMvpCt = g_cvarPointsMvpCt.IntValue;
	g_PointsMvpTr = g_cvarPointsMvpTr.IntValue;
	g_PointsBombDropped = g_cvarPointsBombDropped.IntValue;
	g_PointsBombPickup = g_cvarPointsBombPickup.IntValue;
	g_PointsMatchWin = g_cvarPointsMatchWin.IntValue;
	g_PointsMatchDraw = g_cvarPointsMatchDraw.IntValue;
	g_PointsMatchLose = g_cvarPointsMatchLose.IntValue;
	g_PointsFb = g_cvarPointsFb.IntValue;
	g_PointsNS = g_cvarPointsNS.IntValue;
	g_bNSAllSnipers = g_cvarNSAllSnipers.BoolValue;
	g_PointsAssistKill = g_cvarPointsAssistKill.IntValue;
	g_PointsMin = g_cvarPointsMin.IntValue;
	g_bPointsMinEnabled = g_cvarPointsMin.BoolValue;
	g_iSeasonId = g_cvarSeason.IntValue;
	g_cvarAPIURL.GetString(g_sAPIURL, sizeof(g_sAPIURL));
}

public int GetWeaponNum(char[] weaponname) {
	for (int i = 0; i < 42; i++) {
		if (StrEqual(weaponname, g_sWeaponsNamesGame[i])) {
			return i;
		}
	}

	return 43;
}

public Action Event_VipEscaped(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int client = GetClientOfUserId(GetEventInt(event, "userid"));

	for (int i = 1; i <= MaxClients; i++) {
		if (IsValidClient(i) && GetClientTeam(i) == CT) {
			g_aStats[i].SCORE += g_PointsVipEscapedTeam;
		}
	}

	g_aStats[client].VIP_PLAYED++;
	g_aStats[client].VIP_ESCAPED++;
	g_aStats[client].SCORE += g_PointsVipEscapedPlayer;
}

public Action Event_VipKilled(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	int killer = GetClientOfUserId(GetEventInt(event, "attacker"));

	for (int i = 1; i <= MaxClients; i++) {
		if (IsValidClient(i) && GetClientTeam(i) == TR) {
			g_aStats[i].SCORE += g_PointsVipKilledTeam;
		}
	}
	g_aStats[client].VIP_PLAYED++;
	g_aStats[killer].VIP_KILLED++;
	g_aStats[killer].SCORE += g_PointsVipKilledPlayer;
}

public Action Event_HostageRescued(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}	

	int client = GetClientOfUserId(GetEventInt(event, "userid"));

	for (int i = 1; i <= MaxClients; i++) {
		if (IsValidClient(i) && GetClientTeam(i) == CT) {
			g_aStats[i].SCORE += g_PointsHostageRescTeam;
		}
	}

	g_aStats[client].HOSTAGES_RESCUED++;
	g_aStats[client].SCORE += g_PointsHostageRescPlayer;
}

public void Get5_OnMapResult(const char[] map, MatchTeam mapWinner, int team1Score, int team2Score, int mapNumber) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	char auth[20];
	MatchTeam playerTeam = MatchTeam_TeamNone;

	for(int i = 0; i <= MaxClients; i++)
	{
		if (IsValidClient(i)) {
			GetClientAuthId(i, AuthId_SteamID64, auth, sizeof(auth));
			playerTeam = Get5_GetPlayerTeam(auth);
			
			if (playerTeam == MatchTeam_TeamSpec) {
				continue;	
			} else if (mapWinner == MatchTeam_TeamNone) {
				g_aStats[i].MATCH_DRAW++;
				g_aStats[i].SCORE += g_PointsMatchDraw;
			} else if (playerTeam == mapWinner) {
				g_aStats[i].MATCH_WIN++;
				g_aStats[i].SCORE += g_PointsMatchWin;
			} else {
				g_aStats[i].MATCH_LOSE++;
				g_aStats[i].SCORE -= g_PointsMatchLose;
			}
			savePlayer(i);
		}
	}
}

public Action Event_RoundMVP(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	if (!IsValidClient(client)) {
		return;
	}

	int team = GetClientTeam(client);

	if (((team == 2 && g_PointsMvpTr > 0) || (team == 3 && g_PointsMvpCt > 0)) && client != 0 && !IsFakeClient(client)) {
		if (team == 2) {
			g_aStats[client].SCORE += g_PointsMvpTr;
		} else {
			g_aStats[client].SCORE += g_PointsMvpCt;
		}
	}

	g_aStats[client].MVP++;
}

public Action Event_RoundEnd(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int Winner = GetEventInt(event, "winner");
	for (int i = 1; i <= MaxClients; i++) {
		if (IsValidClient(i)) {
			if (Winner == TR) {
				if (GetClientTeam(i) == TR) {
					g_aStats[i].TR_WIN++;

					if (g_PointsRoundWin[TR] > 0) {
						g_aStats[i].SCORE += g_PointsRoundWin[TR];
					}
				} else if (GetClientTeam(i) == CT) {
					if (g_PointsRoundLose[CT] > 0) {
						g_aStats[i].SCORE -= g_PointsRoundLose[CT];
					}
				}
			} else if (Winner == CT) {
				if (GetClientTeam(i) == CT) {
					g_aStats[i].CT_WIN++;

					if (g_PointsRoundWin[CT] > 0) {
						g_aStats[i].SCORE += g_PointsRoundWin[CT];
					}
				} else if (GetClientTeam(i) == TR) {
					if (g_PointsRoundLose[TR] > 0) {
						g_aStats[i].SCORE -= g_PointsRoundLose[TR];
					}
				}
			}
			savePlayer(i);
		}
	}
}

public void Event_RoundStart(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	firstblood = false;

	for (int i = 1; i <= MaxClients; i++) {
		if (IsValidClient(i)) {
			if (GetClientTeam(i) == TR) {
				g_aStats[i].ROUNDS_TR++;
			} else if (GetClientTeam(i) == CT) {
				g_aStats[i].ROUNDS_CT++;
			}
		}
	}
}

public Action Event_BombPlanted(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int client = GetClientOfUserId(GetEventInt(event, "userid"));

	g_C4PlantedBy = client;

	for (int i = 1; i <= MaxClients; i++) {
		if (IsValidClient(i) && GetClientTeam(i) == TR) {
			g_aStats[i].SCORE += g_PointsBombPlantedTeam;
		}
	}

	g_aStats[client].C4_PLANTED++;
	g_aStats[client].SCORE += g_PointsBombPlantedPlayer;
}

public Action Event_BombDefused(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int client = GetClientOfUserId(GetEventInt(event, "userid"));

	for (int i = 1; i <= MaxClients; i++) {
		if (IsValidClient(i) && GetClientTeam(i) == CT) {
			g_aStats[i].SCORE += g_PointsBombDefusedTeam;
		}
	}

	g_aStats[client].C4_DEFUSED++;
	g_aStats[client].SCORE += g_PointsBombDefusedPlayer;
}

public Action Event_BombExploded(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int client = g_C4PlantedBy;

	for (int i = 1; i <= MaxClients; i++) {
		if (IsValidClient(i) && GetClientTeam(i) == TR) {
			g_aStats[i].SCORE += g_PointsBombExplodeTeam;
		}
	}

	g_aStats[client].C4_EXPLODED++;
	g_aStats[client].SCORE += g_PointsBombExplodePlayer;
}

public Action Event_BombPickup(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int client = GetClientOfUserId(GetEventInt(event, "userid"));

	if (!IsValidClient(client)) {
		return;
	}

	g_aStats[client].SCORE += g_PointsBombPickup;
}

public Action Event_BombDropped(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int client = GetClientOfUserId(GetEventInt(event, "userid"));

	g_aStats[client].SCORE -= g_PointsBombDropped;
}

public Action Event_PlayerDeath(Handle event, const char [] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int victim = GetClientOfUserId(GetEventInt(event, "userid"));
	int attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
	int assist = GetClientOfUserId(GetEventInt(event, "assister"));

	char weapon[64];
	GetEventString(event, "weapon", weapon, sizeof(weapon));
	ReplaceString(weapon, sizeof(weapon), "weapon_", "");

	if (attacker != 0 && (IsFakeClient(victim) || IsFakeClient(attacker))) {
		return;
	}

	if (victim == attacker || attacker == 0) {
		g_aStats[victim].SUICIDES++;
		g_aStats[victim].SCORE -= g_PointsLoseSuicide;

		if (g_bPointsMinEnabled) {
			if (g_aStats[victim].SCORE < g_PointsMin) {
				g_aStats[victim].SCORE = g_PointsMin;
			}
		}

	} else if (!g_bFfa && (GetClientTeam(victim) == GetClientTeam(attacker))) {
		if (attacker < MaxClients) {
			g_aStats[attacker].TK++;
			g_aStats[attacker].SCORE -= g_PointsLoseTk;

			if (g_bPointsMinEnabled) {
				if (g_aStats[victim].SCORE < g_PointsMin) {
					g_aStats[victim].SCORE = g_PointsMin;
				}
			}
		}
	} else {
		int team = GetClientTeam(attacker);
		bool headshot = GetEventBool(event, "headshot");

		// knife
		if (StrContains(weapon, "knife") != -1 ||
			StrEqual(weapon, "bayonet") ||
			StrEqual(weapon, "melee") ||
			StrEqual(weapon, "axe") ||
			StrEqual(weapon, "hammer") ||
			StrEqual(weapon, "spanner") ||
			StrEqual(weapon, "fists")) {
			weapon = "knife";
		}

		// breachcharge has projectile
		if (StrContains(weapon, "breachcharge") != -1) {
			weapon = "breachcharge";
		}

		// firebomb = molotov
		if (StrEqual(weapon, "firebomb")) {
			weapon = "molotov";
		}

		// diversion = decoy, and decoy has projectile
		if (StrContains(weapon, "diversion") != -1 || StrContains(weapon, "decoy") != -1) {
			weapon = "decoy";
		}

		int score_dif;
		if (attacker < MaxClients) {
			score_dif = g_aStats[victim].SCORE - g_aStats[attacker].SCORE;
		}

		if (score_dif < 0 || attacker >= MaxClients) {
			score_dif = g_PointsKill[team];
		} else {
			if (g_PointsKillBonusDif[team] == 0) {
				score_dif = g_PointsKill[team] + ((g_aStats[victim].SCORE - g_aStats[attacker].SCORE) * g_PointsKillBonus[team]);
			} else {
				score_dif = g_PointsKill[team] + (((g_aStats[victim].SCORE - g_aStats[attacker].SCORE) / g_PointsKillBonusDif[team]) * g_PointsKillBonus[team]);
			}
		}

		if (StrEqual(weapon, "knife")) {
			score_dif = RoundToCeil(score_dif * g_fPointsKnifeMultiplier);
		} else if (StrEqual(weapon, "taser")) {
			score_dif = RoundToCeil(score_dif * g_fPointsTaserMultiplier);
		}

		if (headshot && attacker < MaxClients) {
			g_aStats[attacker].HEADSHOTS++;
		}

		g_aStats[victim].DEATHS++;

		if (attacker < MaxClients) {
			g_aStats[attacker].KILLS++;
		}

		if (g_bPointsLoseRoundCeil) {
			g_aStats[victim].SCORE -= RoundToCeil(score_dif * g_fPercentPointsLose);

			if (g_bPointsMinEnabled) {
				if (g_aStats[victim].SCORE < g_PointsMin) {
					g_aStats[victim].SCORE = g_PointsMin;
				}
			}
		} else {
			g_aStats[victim].SCORE -= RoundToFloor(score_dif * g_fPercentPointsLose);

			if (g_bPointsMinEnabled) {
				if (g_aStats[victim].SCORE < g_PointsMin) {
					g_aStats[victim].SCORE = g_PointsMin;
				}
			}
		}

		if (attacker < MAXPLAYERS) {
			g_aStats[attacker].SCORE += score_dif;
			int num = GetWeaponNum(weapon); 
			if (num < 42) {
				switch(num) {
					case 0: {
						g_aWeapons[attacker].KNIFE++;
					}
					case 1: {
						g_aWeapons[attacker].GLOCK++;
					}
					case 2: {
						g_aWeapons[attacker].HKP2000++;
					}
					case 3: {
						g_aWeapons[attacker].USP_SILENCER++;
					}
					case 4: {
						g_aWeapons[attacker].P250++;
					}
					case 5: {
						g_aWeapons[attacker].DEAGLE++;
					}
					case 6: {
						g_aWeapons[attacker].ELITE++;
					}
					case 7: {
						g_aWeapons[attacker].FIVESEVEN++;
					}
					case 8: {
						g_aWeapons[attacker].TEC9++;
					}
					case 9: {
						g_aWeapons[attacker].CZ75A++;
					}
					case 10: {
						g_aWeapons[attacker].REVOLVER++;
					}
					case 11: {
						g_aWeapons[attacker].NOVA++;
					}
					case 12: {
						g_aWeapons[attacker].XM1014++;
					}
					case 13: {
						g_aWeapons[attacker].MAG7++;
					}
					case 14: {
						g_aWeapons[attacker].SAWEDOFF++;
					}
					case 15: {
						g_aWeapons[attacker].BIZON++;
					}
					case 16: {
						g_aWeapons[attacker].MAC10++;
					}
					case 17: {
						g_aWeapons[attacker].MP9++;
					}
					case 18: {
						g_aWeapons[attacker].MP7++;
					}
					case 19: {
						g_aWeapons[attacker].UMP45++;
					}
					case 20: {
						g_aWeapons[attacker].P90++;
					}
					case 21: {
						g_aWeapons[attacker].GALILAR++;
					}
					case 22: {
						g_aWeapons[attacker].AK47++;
					}
					case 23: {
						g_aWeapons[attacker].SCAR20++;
					}
					case 24: {
						g_aWeapons[attacker].FAMAS++;
					}
					case 25: {
						g_aWeapons[attacker].M4A1++;
					}
					case 26: {
						g_aWeapons[attacker].M4A1_SILENCER++;
					}
					case 27: {
						g_aWeapons[attacker].AUG++;
					}
					case 28: {
						g_aWeapons[attacker].SSG08++;
					}
					case 29: {
						g_aWeapons[attacker].SG556++;
					}
					case 30: {
						g_aWeapons[attacker].AWP++;
					}
					case 31: {
						g_aWeapons[attacker].G3SG1++;
					}
					case 32: {
						g_aWeapons[attacker].M249++;
					}
					case 33: {
						g_aWeapons[attacker].NEGEV++;
					}
					case 34: {
						g_aWeapons[attacker].HEGRENADE++;
					}
					case 35: {
						g_aWeapons[attacker].FLASHBANG++;
					}
					case 36: {
						g_aWeapons[attacker].SMOKEGRENADE++;
					}
					case 37: {
						g_aWeapons[attacker].INFERNO++;
					}
					case 38: {
						g_aWeapons[attacker].DECOY++;
					}
					case 39: {
						g_aWeapons[attacker].TASER++;
					}
					case 40: {
						g_aWeapons[attacker].MP5SD++;
					}
					case 41: {
						g_aWeapons[attacker].BREACHCHARGE++;
					}
				}
			}
		}

		if (headshot && attacker < MaxClients) {
			g_aStats[attacker].SCORE += g_PointsHs;
		}

		if (!firstblood && attacker < MaxClients) {
			g_aStats[attacker].SCORE += g_PointsFb;

			g_aStats[attacker].FB++;
		}

		if (attacker < MaxClients && ((StrContains(weapon, "awp") != -1 || StrContains(weapon, "ssg08") != -1) || (g_bNSAllSnipers && (StrContains(weapon, "g3sg1") != -1 || StrContains(weapon, "scar20") != -1))) && (GetEntProp(attacker, Prop_Data, "m_iFOV") <= 0 || GetEntProp(attacker, Prop_Data, "m_iFOV") == GetEntProp(attacker, Prop_Data, "m_iDefaultFOV"))) {
			g_aStats[attacker].SCORE+= g_PointsNS;
			g_aStats[attacker].NS++;

			float fNSD = Math_UnitsToMeters(Entity_GetDistance(victim, attacker));

			// stats are int, so we change it from m to cm
			int iNSD = RoundToFloor(fNSD * 100);
			if (iNSD > g_aStats[attacker].NSD) {
				g_aStats[attacker].NSD = iNSD;
			}
		}
	}

	if (assist && attacker < MaxClients) {
		// Do not attack your teammate, my friend
		if (GetClientTeam(victim) == GetClientTeam(assist))	{
			return;
		} else {
			g_aStats[assist].SCORE+= g_PointsAssistKill;
			g_aStats[assist].ASSISTS++;
		}
	}

	if (attacker < MaxClients) {
		if (g_aStats[attacker].KILLS == 50) {
			g_TotalPlayers++;
		}
	}

	firstblood = true;
}

public Action Event_PlayerHurt(Handle event, const char [] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int victim = GetClientOfUserId(GetEventInt(event, "userid"));
	int attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
	if (attacker == 0 || IsFakeClient(victim) || IsFakeClient(attacker)) {
		return;
	}

	if (victim != attacker && attacker > 0 && attacker < MaxClients) {
		int hitgroup = GetEventInt(event, "hitgroup");
		if (hitgroup == 0) {
			// Player was hit by knife, he, flashbang, or smokegrenade.
			return;
		}

		if (hitgroup == 8) {
			hitgroup = 1;
		}

		g_aStats[attacker].HITS++;
		switch(hitgroup) {
			case 1:
			{
				g_aHitBox[attacker].HEAD++;
			}
			case 2:
			{
				g_aHitBox[attacker].CHEST++;
			}
			case 3:
			{
				g_aHitBox[attacker].STOMACH++;
			}
			case 4:
			{
				g_aHitBox[attacker].LEFT_ARM++;
			}
			case 5:
			{
				g_aHitBox[attacker].RIGHT_ARM++;
			}
			case 6:
			{
				g_aHitBox[attacker].LEFT_LEG++;
			}
			case 7:
			{
				g_aHitBox[attacker].RIGHT_LEG++;
			}
		}

		int damage = GetEventInt(event, "dmg_health");
		g_aStats[attacker].DAMAGE += damage;
	}
}

public Action Event_WeaponFire(Handle event, const char[] name, bool dontBroadcast) {
	if (!g_bEnabled || !isMatchLive()) {
		return;
	}

	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	if (!IsValidClient(client)) {
		return;
	}

	// Don't count knife being used neither hegrenade, flashbang and smokegrenade being threw
	char sWeaponUsed[50];
	GetEventString(event, "weapon", sWeaponUsed, sizeof(sWeaponUsed));
	ReplaceString(sWeaponUsed, sizeof(sWeaponUsed), "weapon_", "");
	if (StrContains(sWeaponUsed, "knife") != -1 ||
		StrEqual(sWeaponUsed, "bayonet") ||
		StrEqual(sWeaponUsed, "melee") ||
		StrEqual(sWeaponUsed, "axe") ||
		StrEqual(sWeaponUsed, "hammer") ||
		StrEqual(sWeaponUsed, "spanner") ||
		StrEqual(sWeaponUsed, "fists") ||
		StrEqual(sWeaponUsed, "hegrenade") ||
		StrEqual(sWeaponUsed, "flashbang") ||
		StrEqual(sWeaponUsed, "smokegrenade") ||
		StrEqual(sWeaponUsed, "inferno") ||
		StrEqual(sWeaponUsed, "molotov") ||
		StrEqual(sWeaponUsed, "incgrenade") ||
		StrContains(sWeaponUsed, "decoy") != -1 ||
		StrEqual(sWeaponUsed, "firebomb") ||
		StrEqual(sWeaponUsed, "diversion") ||
		StrContains(sWeaponUsed, "breachcharge") != -1) {
		return;
	}

	g_aStats[client].SHOTS++;
}

public void OnClientPutInServer(int client) {
	if (!IsValidClient(client) || !g_iSeasonId) {
		return;
	}

	connectedTime[client] = GetTime();

	char auth[20];
	GetClientAuthId(client, AuthId_SteamID64, auth, sizeof(auth));

	HTTPRequest req = CreateRequest("ranks/%s/season/%d", auth, g_iSeasonId);
	if (req != null) {
		req.Get(RequestScoreCallback, client);
	}
}

stock bool IsValidClient(int client) {
	if (client <= 0 || client > MaxClients || !IsClientConnected(client) ||  IsFakeClient(client) || !IsClientInGame(client)) {
		return false;
	}

	return true;
}

bool isMatchLive() {
	Get5State matchState = Get5_GetGameState();
	return (matchState == Get5State_Live || matchState == Get5State_PostGame);
}

stock float Math_UnitsToMeters(float units) {
	return (units * GAMEUNITS_TO_METERS);
}

stock float Entity_GetDistanceOrigin(int entity, const float vec[3]) {
	float entityVec[3];

	return GetVectorDistance(entityVec, vec);
}

stock float Entity_GetDistance(int entity, int target) {
	float targetVec[3];

	return Entity_GetDistanceOrigin(entity, targetVec);
}

void savePlayer(int client) {
	if (g_aStats[client].SCORE == 0 || !g_iSeasonId) {
		return;
	}

	char auth[20];
	char lastConnect[20];
	int currTime = GetTime();

	g_aStats[client].CONNECTED = currTime - connectedTime[client];
	connectedTime[client] = currTime;

	GetClientAuthId(client, AuthId_SteamID64, auth, sizeof(auth));
	IntToString(currTime, lastConnect, sizeof(lastConnect));

	HTTPRequest req = CreateRequest("ranks/%s/season/%d", auth, g_iSeasonId);
	JSONObject body = new JSONObject();
	if (req != null) {
		// Player stats
		body.SetInt("score", g_aStats[client].SCORE);
		body.SetInt("kills", g_aStats[client].KILLS);
		body.SetInt("deaths", g_aStats[client].DEATHS);
		body.SetInt("assists", g_aStats[client].ASSISTS);
		body.SetInt("suicides", g_aStats[client].SUICIDES);
		body.SetInt("tk", g_aStats[client].TK);
		body.SetInt("shots", g_aStats[client].SHOTS);
		body.SetInt("hits", g_aStats[client].HITS);
		body.SetInt("headshots", g_aStats[client].HEADSHOTS);
		body.SetInt("connected", g_aStats[client].CONNECTED);
		body.SetInt("rounds_tr", g_aStats[client].ROUNDS_TR);
		body.SetInt("rounds_ct", g_aStats[client].ROUNDS_CT);
		body.SetInt64("lastconnect", lastConnect);
		body.SetInt("c4_planted", g_aStats[client].C4_PLANTED);
		body.SetInt("c4_exploded", g_aStats[client].C4_EXPLODED);
		body.SetInt("c4_defused", g_aStats[client].C4_DEFUSED);
		body.SetInt("ct_win", g_aStats[client].CT_WIN);
		body.SetInt("tr_win", g_aStats[client].TR_WIN);
		body.SetInt("hostages_rescued", g_aStats[client].HOSTAGES_RESCUED);
		body.SetInt("vip_killed", g_aStats[client].VIP_KILLED);
		body.SetInt("vip_escaped", g_aStats[client].VIP_ESCAPED);
		body.SetInt("vip_played", g_aStats[client].VIP_PLAYED);
		body.SetInt("mvp", g_aStats[client].MVP);
		body.SetInt("damage", g_aStats[client].DAMAGE);
		body.SetInt("match_win", g_aStats[client].MATCH_WIN);
		body.SetInt("match_draw", g_aStats[client].MATCH_DRAW);
		body.SetInt("match_lose", g_aStats[client].MATCH_LOSE);
		body.SetInt("first_blood", g_aStats[client].FB);
		body.SetInt("no_scope", g_aStats[client].NS);
		body.SetInt("no_scope_dis", g_aStats[client].NSD);
		// Weapon stats
		body.SetInt("knife", g_aWeapons[client].KNIFE);
		body.SetInt("glock", g_aWeapons[client].GLOCK);
		body.SetInt("hkp2000", g_aWeapons[client].HKP2000);
		body.SetInt("usp_silencer", g_aWeapons[client].USP_SILENCER);
		body.SetInt("p250", g_aWeapons[client].P250);
		body.SetInt("deagle", g_aWeapons[client].DEAGLE);
		body.SetInt("elite", g_aWeapons[client].ELITE);
		body.SetInt("fiveseven", g_aWeapons[client].FIVESEVEN);
		body.SetInt("tec9", g_aWeapons[client].TEC9);
		body.SetInt("cz75a", g_aWeapons[client].CZ75A);
		body.SetInt("revolver", g_aWeapons[client].REVOLVER);
		body.SetInt("nova", g_aWeapons[client].NOVA);
		body.SetInt("xm1014", g_aWeapons[client].XM1014);
		body.SetInt("mag7", g_aWeapons[client].MAG7);
		body.SetInt("sawedoff", g_aWeapons[client].SAWEDOFF);
		body.SetInt("bizon", g_aWeapons[client].BIZON);
		body.SetInt("mac10", g_aWeapons[client].MAC10);
		body.SetInt("mp9", g_aWeapons[client].MP9);
		body.SetInt("mp7", g_aWeapons[client].MP7);
		body.SetInt("ump45", g_aWeapons[client].UMP45);
		body.SetInt("p90", g_aWeapons[client].P90);
		body.SetInt("galilar", g_aWeapons[client].GALILAR);
		body.SetInt("ak47", g_aWeapons[client].AK47);
		body.SetInt("scar20", g_aWeapons[client].SCAR20);
		body.SetInt("famas", g_aWeapons[client].FAMAS);
		body.SetInt("m4a1", g_aWeapons[client].M4A1);
		body.SetInt("m4a1_silencer", g_aWeapons[client].M4A1_SILENCER);
		body.SetInt("aug", g_aWeapons[client].AUG);
		body.SetInt("ssg08", g_aWeapons[client].SSG08);
		body.SetInt("sg556", g_aWeapons[client].SG556);
		body.SetInt("awp", g_aWeapons[client].AWP);
		body.SetInt("g3sg1", g_aWeapons[client].G3SG1);
		body.SetInt("m249", g_aWeapons[client].M249);
		body.SetInt("negev", g_aWeapons[client].NEGEV);
		body.SetInt("hegrenade", g_aWeapons[client].HEGRENADE);
		body.SetInt("flashbang", g_aWeapons[client].FLASHBANG);
		body.SetInt("smokegrenade", g_aWeapons[client].SMOKEGRENADE);
		body.SetInt("inferno", g_aWeapons[client].INFERNO);
		body.SetInt("decoy", g_aWeapons[client].DECOY);
		body.SetInt("taser", g_aWeapons[client].TASER);
		body.SetInt("mp5sd", g_aWeapons[client].MP5SD);
		body.SetInt("breachcharge", g_aWeapons[client].BREACHCHARGE);
		// Hits stats
		body.SetInt("left_arm", g_aHitBox[client].LEFT_ARM);
		body.SetInt("right_arm", g_aHitBox[client].RIGHT_ARM);
		body.SetInt("left_leg", g_aHitBox[client].LEFT_LEG);
		body.SetInt("right_leg", g_aHitBox[client].RIGHT_LEG);
		body.SetInt("head", g_aHitBox[client].HEAD);
		body.SetInt("chest", g_aHitBox[client].CHEST);
		body.SetInt("stomach", g_aHitBox[client].STOMACH);

		req.Put(body, RequestCallback, client);
	}
	delete body;
}

static HTTPRequest CreateRequest(const char[] apiMethod, any:...) {
	char url[1024];
	Format(url, sizeof(url), "%s%s", g_sAPIURL, apiMethod);
	char formattedUrl[1024];
	VFormat(formattedUrl, sizeof(formattedUrl), url, 2);

	HTTPRequest req = new HTTPRequest(formattedUrl);
	if (req == INVALID_HANDLE) {
		LogError("Failed to create request to %s", formattedUrl);
		return null;
	} else {
		return req;
	}
}

public void RequestCallback(HTTPResponse response, int client) {
    if (response.Status >= HTTPStatus_InternalServerError) {
        LogError("[ERR] API request failed, HTTP status code: %d", response.Status);
        char sData[1024];
        response.Data.ToString(sData, sizeof(sData), JSON_INDENT(4));
        LogError("[ERR] Response:\n%s", sData);
    } else {
		g_aStats[client].Reset();
		g_aWeapons[client].Reset();
		g_aHitBox[client].Reset();
	}
}

public void RequestScoreCallback(HTTPResponse response, int client) {
    if (response.Status >= HTTPStatus_InternalServerError) {
        LogError("[ERR] API request failed, HTTP status code: %d", response.Status);
        char sData[1024];
        response.Data.ToString(sData, sizeof(sData), JSON_INDENT(4));
        LogError("[ERR] Response:\n%s", sData);
		g_aStats[client].SCORE = 0;
	} else if (response.Status == HTTPStatus_NotFound) {
		g_aStats[client].SCORE = 1000;
		savePlayer(client);
	} else {
		char sData[2000];
		response.Data.ToString(sData, sizeof(sData));
		JSONObject obj = JSONObject.FromString(sData);

		g_aStats[client].Reset();
		g_aWeapons[client].Reset();
		g_aHitBox[client].Reset();

		int score = obj.GetInt("score");
		g_aStats[client].SCORE = score;

		delete obj;
	}
}