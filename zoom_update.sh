if ((${EUID:-0} || "$(id -u)")); then
  echo You are not root.
  exit 1
else
	apt-get update -y
	apt-get upgrade -y
	wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom_amd64.deb
	dpkg -i /tmp/zoom_amd64.deb
	apt install -f
	apt autoremove -y
	apt autopurge -y
	rm /tmp/zoom_amd64.deb
fi
