# Super project UNIX/Linux operating systems  

Installing and upgrading a Linux system. Administration basics.

## Contents

1. [Part 1. Installing the OS](#part-1-installation-of-the-os)

2. [Part 2. Creating a new user](#part-2-creating-a-user)

3. [Part 3. Setting up the OS network](#part-3-setting-up-the-os-network)

4. [Part 4. Updating the OS](#part-4-updating-the-os)

5. [Part 5. Using the sudo command](#part-5-using-the-sudo-command)

6. [Part 6. Installing and configuring the time service](#part-6-installing-and-configuring-the-time-service)

7. [Part 7. Installing and Using Text Editors](#part-7-installing-and-using-text-editorss)

    7.1 [Vim](#71-vim)
    
    7.2 [Nano](#72-nano)

    7.3 [Joe](#73-joe)

8. [Part 8. Installing and basic configuration of the SSHD service](#part-8-installing-and-basic-setup-of-the-sshd-service)

9. [Part 9. Installing and using the utilities top, htop](#part-9-installing-and-using-the-utilities-top-htop)

    9.1 [Top command output report from top](#top-command-output-report-from-top)

    9.2 [Screenshots of the htop command output](#htop-command-output-report-from-htop)

    9.3 [Sort by PID](#sorted-by-pid)

    9.4 [Sort by PERCENT_CPU](#sorted-by-percentcpu)

    9.5 [Sort by PERCENT_MEM](#sorted-by-percentmem)

    9.6 [Sort by TIME](#sort-by-time)

    9.7 [Filter 'sshd'](#sshd-process)

    9.8 [Search 'syslog'](#syslog-process-found-by-searching)

    9.9 [Advanced hostname, clock and uptime output](#advanced-hostname-clock-and-uptime-output-added)

10. [Using the fdisk utility](#part-10-using-the-fdisk-utility)

11. [Using the df utility](#part-11-using-the-df-utility)

12. [Using the du utility](#part-12-using-the-du-utility)

13. [Installing and Using the ncdu Utility](#part-13-installing-and-using-the-ncdu-utility)

14. [Working with system logs](#part-14-working-with-system-logs)

15. [Using the CRON Job Scheduler](#part-15-using-the-cron-job-scheduler) 

## Part 1. Installation of the OS

>To install Ubuntu 20.04 Server LTS without a graphical interface in VirtualBox, follow these steps:

Step 1: Download the ISO image
Download the Ubuntu 20.04 Server LTS ISO image from the official Ubuntu website (https://ubuntu.com/download/server).

Step 2: Create a new virtual machine
Open VirtualBox and click on theNew" button in the top panel. Enter a name for your virtual machine and select the operating system type as "Linux" and the version as "Ubuntu (64-bit)".

Step 3: Configure virtual machine resources
Choose the amount of memory (RAM) you want to allocate to the virtual machine. It is recommended to use at least 1 GB of RAM for an Ubuntu server installation. Then create a new virtual hard disk by selecting the option "Create a virtual hard disk now" and follow the wizard instructions.

Step 4: Configure system settings
After creating the virtual machine, right-click on it and select "Settings". In the "System" section, make sure the "Motherboard" tab is selected. Here you can configure system settings such as boot order and the number of processors.

Step 5: Configure virtual disk
In the "Storage" section, select the IDE controller and click on the disk icon on the right. Choose the option "Choose a disk file" and browse for the previously downloaded Ubuntu 20.04 Server LTS ISO image.

Step 6: Install Ubuntu Server
Start the virtual machine by clicking the "Start" button in the VirtualBox top panel.

### Сheck of Ubuntu version by running the command
```c
$ cat /etc/issue
```
![part 1](misc/part1_ver.png)

## Part 2. Creating a user 

### To create a user follow the next steps:
```c
$ sudo adduser <user_name>
$ sudo usermod -aG adm <user_name>
$ cat /etc/passwd | grep <user_name>
```
![part 2.1](misc/part2_user1.png)

```c
$ groups <user_name>
```
![part 2.2](misc/part%202_user2.png)

## Part 3. Setting up the OS network

### 1. Setting the machine name as user-1:
```c
$ hostnamectl set-hostname <host_name>
```

System information can be displayed with use of command:
```c
$ hostnamectl
```
and name with use of command:
```c
$ hostname
```
![part 3.1](misc/part3_network1.png)

### 2. Setting the time zone corresponding to your current location:
```c
$ sudo timedatectl
$ sudo timedatectl set-timezone Europe/Moscow
$ sudo timedatectl
```
![part 3.2](misc/part3_timedate.png)


### 3. Display the names of the network interfaces using a console command

>The network interface of the lo device in the Linux operating system is commonly referred to as the "loopback interface" or simply "lo". The loopback interface is a virtual network interface used for testing and exchanging data between different processes on the same device.

The loopback interface has an IP address of 127.0.0.1 and is often referred to as "localhost". When a process sends data to the lo interface, it is routed through the TCP/IP protocol stack and returned back to the sender without being physically transmitted over the network. This allows programs to test the functionality of network services even when there is no actual connection to other devices.

```c
$ sudo apt install net-tools
```
To output the names of the network interfaces:
```c
$ ifconfig -a
```
![part 3.1 ](misc/part3_net_working.png)

### 4. Get the ip address of the device you are working on from the DHCP server

> DHCP stands for Dynamic Host Configuration Protocol. It is a network protocol commonly used to automate the process of assigning IP addresses and other network configuration parameters to devices on a network. By using DHCP, network administrators can centrally manage and distribute IP addresses to devices, making it easier to set up and maintain large networks.
```c
$ hostname -I
```
![part 3.4](misc/part3_hostname.png)

### 5. Define and display the external ip address of the gateway (ip) and the internal IP address of the gateway, aka default ip address (gw)

Defining the external IP address of the gateway:
```c
$ curl ifconfig.me/ip
```
![part 3.5.1](misc/part3_externalIP.png)

Define the internal IP address of the gateway:
```c
$ ip route show default | awk /default/ {print $3}
```
![part 3.5.2](misc/part3_internalIP.png)


### 6. Set static (manually set, not received from DHCP server) ip, gw, dns settings (use public DNS servers, e.g. 1.1.1.1 or 8.8.8.8)

To change the file use command:
```c
$ sudo vim /etc/netplan/00-installer-config.yaml
```
![part 3.6.1](misc/part3_filechange.png)
To save all changes
```c
$ sudo netplan apply
```

### 7. Reboot the virtual machine
```c
$ reboot
```
To make sure that the settings have been changed:
```c
$ ifconfig
```
![part 3.7](misc/part3_net_working.png)

To check if remote hosts 1.1.1.1 and ya.ru are pinged successfully:
```c
$ ping 1.1.1.1
$ ping ya.ru
```
![part 3.7](misc/part3_ping.png)



## Part 4. Updating the OS

### To update the system to the latest version use commands

```c
$ sudo apt update
$ sudo apt upgrade
```
![part4](misc/part4_update.png)

## Part 5. Using the sudo command

> The `sudo` command in Linux is used to execute commands with administrative privileges. It allows authorized users to perform tasks that require root or superuser access without actually logging in as the root user. By using sudo, users can run specific commands with elevated privileges while still retaining their regular user permissions for other operations. This helps enhance security by controlling and monitoring administrative actions on a system.

```c
$ sudo usermod -a -G sudo user-1
$ su user-1
$ cat /etc/hostname
$ sudo hostname kerenfet-server
$ su kerenfet
```
![part 5.1](misc/part5_hostname.png)

## Part 6. Installing and configuring the time service

### To set up the automatic time synchronisation service
```c
$ sudo timedatectl
$ timdatectl show
```
![part 6.1](misc/part6_timedatesync.png)

## Part 7. Installing and using text editors

### To install text editor  `VIM, NANO, JOE` use commands:

```c
$ sudo apt update
$ sudo apt install vim
$ sudo apt install nano
$ sudo apt install joe
```

### 7.1 VIM 

### Main commands

- edit mode `I`
- exit Edit mode `Esc`
- save changes `Shift + Z + Z`

Creating a new file
```c
$ vim test_vim.txt
```
![part 7.1](misc/part7_viminsert.png)

>  To find th word press the / key to enter search mode. The cursor will move to the bottom left corner of the screen, indicating that you're in search mode. Type the word you want to search for and press Enter. Vim will highlight the first occurrence of the word.

![part7.2](misc/part7.2_searching.png)
>To find the next occurrence of the word, you can press n. Vim will move the cursor to the next match.
If you want to search for the previous occurrence, you can press N.

> To replace a word in the Vim editor on Linux, you can use the command : `%s/old_word/new_word/g`.

`%s` performs a search and replace operation throughout the entire file.

`/old_word/` is the search pattern for the old word. Replace it with what you need.

`/new_word/` is the new word you want to replace the old word with. Replace it with your desired value.

`g` indicates replacing all occurrences on a line. If omitted, Vim will replace only the first occurrence on each line.

![part 7.3](misc/part7.3_replacing.png)

### 7.2 NANO

### Main commands

- save changes `Ctrl + O` > Enter
- exit Nano `Ctrl + X`
- open the Nano menu `Ctrl+X`
- open a file content search `Ctrl + W`
- replace a word use the `Alt + R` or `Option + R`

Creating a new file
```c
$ nano test_nano.txt
```
![part 7.2.1](misc/part7_nanofile.png)

> To open a file content search use Ctrl + W command. Then, press Enter

![part 7.2.2](misc/part7_nanosearch.png)

>To replace a word or phrase with another, use the Alt + R or Option + R key combination, then type a new word or phrase, press Enter

![part 7.2.3](misc/part7_viminsert.png)

### 7.3 JOE 

- exit `Joe Ctrl + K` after press `X`
- exit text editing mode `Ctrl+K` and then `Q`

```c
$ joe test_nano.txt
```
![part 7.3.1](misc/part7_joefile.png)
>For searching for a word press Ctrl + K, then press the F key.

![part 7.3.2](misc/part7_joereplacing2.png)

>To replace the word press the Ctrl + K key, then the F key. This opens the search bar at the bottom of the screen. Enter the word you're looking for, then press Enter. Joe suggest the choice, press R to replace the word, then enter a new word. Press Enter to replace the highlighted matches found.

![part 7.3.3](misc/part7_joereplacing.png)
![part 7.3.4](misc/part7_joereplacing2.png)


## Part 8. Installing and basic setup of the SSHD service

### install the SSHd service

```c
$ sudo apt-get install ssh
```
To configure auto-start services at system startup

```c
$ sudo systemctl enable ssh
$ systemctl status ssh
```
![part 8.1](misc/part8_systemctl.png)

### Reset the SSHd service to port 2022

```c
$ sudo vim /etc/ssh/sshd_config
```
![part 8.2](misc/part8_port2022.png)
```c
$ systemctl restart sshd
```
![part 8.2.2](misc/part8_(2)port2022.png)

### Show the presence of the sshd process using the ps command
```c
$ ps -e | grep sshd
```
- `ps`: The ps command stands for "process status" and is used to provide information about currently running processes on a system.

- `-ef`: This option specifies the format in which the output of the ps command should be displayed. In this case, -e selects all processes, and -f provides full-format listing.

- `|`: The pipe symbol (|) is used to redirect the output of one command as input to another command. In this case, it allows the output of the ps command to be used as input for the grep command.

- `grep`: The grep command is used to search for specific patterns or lines of text within the input provided. It is commonly used to filter and extract relevant information from command output.

- `sshd`: This is the pattern or keyword that grep will search for in the input. In this case, we're searching for lines containing the term "sshd," which represents the sshd process.

![part 8.3](misc/part8_sshdpresence.png)

Other keys:

- `ps` (shows the running processes executed by the user in the terminal window);
- `ps -e` or `ps -A` (To view all running processes);
- `ps -d` (To show all processes except session leaders);
- `ps -d -N` (You may invert the output with the `-N` switch. For example, if I want to display only session leaders)
- `ps T` (see only processes related to this terminal);
- `ps r` (see all running (`running`) processes);
- `ps -p 'pid'` (if you know the process PID, you can simply use the following command, to output the process with this `'pid'`);
- `ps -p 'pid1' 'pid2'`
- `ps U 'userlist'` (find all the processes executed by a particular user);
- `ps -ef` (get complete list).

![part 8.4](misc/part8_sshdpresence.png)

### Reboot the system

```c
$ reboot
$ service ssh restart
$ netstat -tan
```
- `-t (--tcp)` displays only tcp connections;
- `-a (--all)` display all active TCP connections;
- `-n (--numeric)` display active TCP connections with addresses and port numbers in numeric format;
- `Proto:` Protocol name (TCP protocol or UDP protocol);
- `recv-Q:` queue to receive the network;
- `send-Q:` Network Send Queue;
- `Local Address` address of the local computer and the port number used;
- `Foreign Address` address and number of the remote computer to which the socket is connected;
- `State` socket state;
- `0.0.0.0` means the IP address on the local machine.

![part8_5reboot](misc/part8_rebootfinal.png)


## Part 9. Installing and using the utilities top, htop

> The "top" and "htop" commands are both system monitoring tools commonly used in Unix-like operating systems, such as Linux. They provide real-time information about system resource usage, processes, and other system statistics.

### Install the top utility by running the command:
```c
$ sudo apt-get install procps
```
### Install the htop utility by running the command:
```c
$ sudo apt-get install procps
```
Once installed, htop can also be run by typing the htop command in a terminal. htop provides more detailed information about processes and has a more user-friendly interface than top.

```c
$ top
```
### Top command output report from top:

```c
$ top
```

![part 9.1](misc/part9.1_top.png)

- `uptime` - 11 min;

- `number of authorized users` - 1;

- `total system load` - 0.00 0.06 0.07;

- `total number of processes` - 94;

- `cpu load` - 0.7%;

- `memory load` - 148M/1.93G;

- `PID of the process that is using the most memory` - 388;

- `PID of the process taking the most CPU time` - 1204.

### Htop command output report from htop:

```c
$ htop
```
![part 9.1](misc/part9_htop.png)

## sorted by PID

```c
$ htop -s PID 
```

![part 9](misc/part9_pid.png)

## sorted by PERCENT_CPU

```c
$ htop -s PERCENT_CPU
```

![part 9.3](misc/part9_percentcpu.png)


## sorted by PERCENT_MEM

```c
$ htop -s PERCENT_MEM 
```
![part 9.4](misc/part9_MEM.png)


## sorted by TIME

```c
$ htop -s TIME
```

![part 9.5](misc/part12.1_var:log.png) ![](misc/part9_time.png) 

## sshd process

```c
$ htop -p $(pgrep sshd)
```
![part 9.4](misc/part9.4_sshd.png)

## syslog process found by searching

```c
$ htop -p $(pgrep syslog)
```
![part 9.5](misc/part9.4_syslog.png)

## advanced hostname, clock and uptime output added 

```c
press F2 
```
> This command will launch htop with the tree-style header mode and sort the processes based on memory usage. The columns specified include HOST (hostname) and CLOCK_UPTIME (clock and uptime). 

![](misc/part9.5_Advanced%20hostname.png)


## Part 10. Using the fdisk utility

> The `fdisk` utility in Linux is used to manage partitions on a hard disk. It allows you to create, modify, delete, and view partitions on the disk. Here are some basic commands that can be used with the fdisk utility:

- `n`: Create a new partition
- `d`: Delete a partition
- `p`: Print the partition table
- `w`: Write the changes to the disk
- `q`: Quit without saving changes
- `l`: List available partition types

```c
$ sudo fdisk -l
$ swapon
```
![part 10](misc/part10_fdisk.png)

- `HDD name` - VBOX HARDDISK;
- `HDD size` - 15GiB;
- `Number of sectors` - 31457280;

![part 10_swap](misc/part10_swap.png)

- `Swap` size - 1.9G.

## Part 11. Using the df utility

>The df command in Linux is used to display information about available space on file systems. It shows the total size of the file system, used and free space, as well as information about mount points.

```c
$ df
```

![part 11](misc/part11_df.png)

Report for the root partition (/):

- `partition size` - 10218772 Kbyte;
- `used space size` - 4686376 Kbyte;
- `free space size` - 4991724 Kbyte;
- `percentage of usage` - 49%.

```c
$ df -Th
```
![part 11.2](misc/part11_dfTH.png)

Report for the root partition (/):

- `partition size` - 9.8 G;
- `used space size` - 4.5 G;
- `free space size` - 4.8 G;
- `percentage of usage` - 49%;
- `file system type for the partition` - ext4.

## Part 12. Using the du utility

>The du command in Linux is used to estimate disk space usage by files and directories. It allows you to calculate the size of each file directory, as well as the total size of a specified path.

```c
$ sudo du -sh /var/log /var /home 
$ sudo du -s --block-size=1 /var/log /var /home  
```
![part12.1](misc/part12.1_var:log.png)

```c
$ sudo du -sh /var/log/* 
```
![part 12.2](misc/part12.2_var.png)

## Part 13. Installing and using the ncdu utility

>ncdu is a command-line utility in Linux used for disk usage analysis. It stands for "NCurses Disk Usage." ncdu provides a simple and interactive way to explore and analyze disk space usage on your system.

- `Arrow keys`: Navigate through directories and files.
- `Enter`: Open a directory or view file details.
- `d`: Delete selected file or directory (use with caution).
- `r`: Recalculate the disk usage.
- `q`: Quit `ncdu`.

### Output the size of the /home, /var, /var/log folders

```c
$ sudo apt install ncdu
```
```c
$ ncdu /home/
```

![part 13.1](misc/part13.1_ncdu.png)

```c
$ ncdu /var/
```

![part13.2](misc/part13.2_ncduvar.png)

```c
$ ncdu /var/log/
```
![part 13.3](misc/part13.3_var:log.png)

## Part 14. Working with system logs 

>Working with system logs in Linux can be helpful for troubleshooting and monitoring the system. Linux systems typically use the syslog daemon to manage system logs. Here are some common tasks related to working with system logs in Linux:

1. Viewing Logs
2. Filtering Logs 
3. Log Rotation
4. Systemd Journal
5. Monitoring Logs in Real-Time

### Open for viewing:

```c
$ sudo vim /var/log/dmesg
$ sudo vim /var/log/syslog
$ sudo vim /var/log/auth.log
```

- Last successful authorization: Jul 14 20:49:53;
- Username: kerenfet;
- Login method: pam-unix.

![part 14.1](misc/part14_auth.png)

```c
$ sudo systemctl restart ssh
$ cat /var/log/syslog
```
![part 14.2](misc/part14.2_restart.png)

## Part 15. Using the CRON job scheduler 
> CRON (Cron daemon) is a standard task scheduler in Linux and other UNIX-like operating systems. It allows you to automatically run tasks at specified times or with a certain frequency.
You can use the `"crontab -l"` command to view the current task schedule and `"crontab -r"` to remove the current schedule. 
```c
% sudo crontab -e
```
![part 15.1](misc/part15_CRONTAB.png)

```c
% sudo crontab -l
```

> Note that when using CRON, you need to consider permissions and the environment in which tasks are executed. Make sure that the commands and scripts have the correct permissions and are located in a working directory where they can be successfully executed.

![part 15.2](misc/part15.2%20_crontab.png)

### Task logs from the scheduler:

```c
$ cat /var/log/syslog
```
![part 15.3](misc/part15.3_Task%20logs.png)


### Deleting all tasks from the scheduler:

```c
$ sudo crtontab -r
$ sudo crtontab -l
```
![part 15.4](misc/part15.4_CRONTABDeletingtasks.png)