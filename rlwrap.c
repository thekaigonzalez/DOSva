#include <readline/readline.h>
#include <readline/history.h>

char * creadline(char* p)
{
 char* rl = readline(p);
 return rl;
}


void cadd_history(char* hst)
{
 add_history(hst);
}
