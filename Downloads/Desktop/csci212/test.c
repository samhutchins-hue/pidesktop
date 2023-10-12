/* echoChar1.c
 * Echoes a character entered by the user.
 * 2017-09-29: Bob Plantz
 */

#include <unistd.h>

int main(void)
{
  char aLetter;

  write(STDOUT_FILENO, "Enter one character: ", 22); // prompt user
  read(STDIN_FILENO, &aLetter, 2);                   // one character
  //write(STDOUT_FILENO, "You entered: ", 13);         // message
  //write(STDOUT_FILENO, &aLetter, 1);  
 // write(STDOUT_FILENO, "\n", 1);
      
  return 0;
}
