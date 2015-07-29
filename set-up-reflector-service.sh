systemctl enable NetworkManager-wait-online.service

touch /etc/systemd/system/reflector.service
echo "[Unit]" >> /etc/systemd/system/reflector.service
echo "Description=Pacman mirrorlist update" >> /etc/systemd/system/reflector.service
echo "Requires=network.target" >> /etc/systemd/system/reflector.service
echo "After=network.target" >> /etc/systemd/system/reflector.service
echo "[Service]" >> /etc/systemd/system/reflector.service
echo "Type=oneshot" >> /etc/systemd/system/reflector.service
echo "ExecStart=/usr/bin/reflector --protocol http --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist" >> /etc/systemd/system/reflector.service
echo "[Install]" >> /etc/systemd/system/reflector.service
echo "RequiredBy=network.target" >> /etc/systemd/system/reflector.service
