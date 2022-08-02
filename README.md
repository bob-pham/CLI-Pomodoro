# Bash Pomodoro Script 

A simple bash pomodoro script for productivity

## Features:
- Clean minimal CLI UI
- Progress bar and Progress %

# Use

Can be initiated with the following commands:

`./pomodoro "d"` For default settings (25min work interval, 5 minute break, 20 minutes long break)

`./pomodoro [work interval (min)] [break interval (mins)] [long break interval (mins)]`

`./pomodoro` Will prompt you to enter in work/break/long break intervals

- Default settings can be changed by editting global DEFAULT variables
- Intervals can be changed during breaks once a pomodoro sesion has started