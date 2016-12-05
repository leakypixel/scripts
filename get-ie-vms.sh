cd
mkdir ie-vms
cd ie-vms

wget -i https://az412801.vo.msecnd.net/vhd/VMBuild_20131127/VirtualBox/IE8_WinXP/Linux/IE8.WinXP.For.LinuxVirtualBox.txt
wget -i https://az412801.vo.msecnd.net/vhd/VMBuild_20131127/VirtualBox/IE9_Win7/Linux/IE9.Win7.For.LinuxVirtualBox.txt
wget -i https://az412801.vo.msecnd.net/vhd/VMBuild_20131127/VirtualBox/IE10_Win7/Linux/IE10.Win7.For.LinuxVirtualBox.txt
wget -i https://az412801.vo.msecnd.net/vhd/VMBuild_20131127/VirtualBox/IE11_Win7/Linux/IE11.Win7.ForLinuxVirtualBox.txt

if hash unrar 2>/dev/null; then
  unrar x IE11.Win7.ForLinuxVirtualBox.part1.sfx 
  unrar x IE10.Win7.For.LinuxVirtualBox.part1.sfx
  unrar x IE9.Win7.For.LinuxVirtualBox.part1.sfx
  unrar x IE8.WinXP.For.LinuxVirtualBox.part1.sfx
else
  sudo apt-get install unrar
  unrar x IE11.Win7.ForLinuxVirtualBox.part1.sfx 
  unrar x IE10.Win7.For.LinuxVirtualBox.part1.sfx
  unrar x IE9.Win7.For.LinuxVirtualBox.part1.sfx
  unrar x IE8.WinXP.For.LinuxVirtualBox.part1.sfx
fi
