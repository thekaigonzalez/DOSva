#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <readline/readline.h>
#include <readline/history.h>
#include <stdio.h>
#include <unistd.h>

int e_cd(lua_State* L)
{
 chdir(luaL_checkstring(L, 1));
}

int e_readline(lua_State* L)
{
 char* fr = readline(luaL_checkstring(L, 1));
 add_history(fr);
 lua_pushstring(L, fr);
 return 1;
}

int e_cwd(lua_State* L)
{
 char bf[256];
 getcwd(bf, 256);
 lua_pushstring(L, bf);
 return 1;
}

int luaopen_libdos(lua_State* L)
{
 lua_register(L, "readln", e_readline);
 lua_register(L, "getcwd", e_cwd);
 lua_register(L, "chdir", e_cd);
 return 1;
}
