// End-to-end functional test for the x64 SteamWorks extension.
// Calls natives that require the Steam game-server interfaces to have resolved
// (the libsteam_api.so discovery path). On this live, Steam-connected server we
// expect connected=1, vac=1, and ip = the server's real public IP.
#include <sourcemod>
#include <SteamWorks>

public OnPluginStart()
{
	RegServerCmd("sw_e2e", Cmd_SWTest, "Run the SteamWorks x64 e2e test");
	CreateTimer(2.0, Timer_Run);
}

public Action:Timer_Run(Handle:timer)
{
	RunTest();
	return Plugin_Stop;
}

public Action:Cmd_SWTest(args)
{
	RunTest();
	return Plugin_Handled;
}

RunTest()
{
	new bool:connected = SteamWorks_IsConnected();
	new bool:vac = SteamWorks_IsVACEnabled();
	new ip[4];
	new bool:gotip = SteamWorks_GetPublicIP(ip);
	PrintToServer("[SW-E2E] connected=%d vac=%d gotip=%d ip=%d.%d.%d.%d",
		connected, vac, gotip, ip[0], ip[1], ip[2], ip[3]);
}
