# PowerSave on Linux
Easy script to save laptop battery on Linux
<p align="center">
 <img src="https://i.ibb.co/g3LsZ85/psl-logo.png">
</p>

## About

This program saves battery power of a laptop running Linux. Its main feature is that it does everything automatically when the charger is turned off.

## Documentation

The program can:
1. Reduce the brightness of the screen by 2 times
2. Disables the Linux kernel technology NMI Watchdog
3. Disables Bluetooth
4. Lowers the APM of hard drives
5. Puts the audio card into power saving mode
6. Increases the write time to virtual memory

When charging is connected, the program sets the default parameters.

To install, place psl-daemon.service in the "/etc/systemd/system" folder, then psl-config.sh move to /usr/bin and make it executable with the command "sudo chmod +x psl-config.sh ". After that, enter the following commands into the terminal:
"sudo systemctl enable psl-daemon"
"sudo systemctl run psl-daemon"
## Distribute

- [Service Name](Page Link)


## Developers

- [Dmitry Karpov](https://github.com/hlorat-kalia4860)

## License
The PSL project is distributed under the GPL-3.0 license
