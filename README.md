# Minecraft-AntiDDOS
Simple DDOS Protection for Minecraft servers on Linux Servers!

### change in file ports for your minecraft server and bungeecord server! Default port is 25565 you can add more or modify it

## Features

- Flush Existing Rules: The script starts by flushing all existing iptables rules to ensure a clean slate.
- Loopback Interface: It allows all traffic on the loopback interface (lo), which is essential for internal communication.
- Established Connections: It accepts all incoming and outgoing traffic related to established connections, ensuring ongoing connections are not disrupted.
- SSH Access: It explicitly allows SSH traffic on port 22, which is crucial for remote server management.
- Minecraft Server Port: It allows traffic on the Minecraft server port (default is 25565), ensuring the server can communicate with clients.
- Invalid Packets: It drops all packets that are marked as invalid, which helps in mitigating certain types of attacks.
- SYN Flood Protection: It limits the rate of incoming SYN packets to mitigate SYN flood attacks.
- RST Flood Protection: It limits the rate of incoming RST packets to mitigate RST flood attacks.
- TCP Flags: It drops packets with unusual TCP flag combinations, which are often used in various types of attacks.
- ICMP Packets: It drops all ICMP packets, which can help prevent ping-based attacks.
- Logging: It logs all dropped packets for monitoring and analysis.
- Final Drop Rule: It drops all other incoming traffic that doesn’t match the above rules, providing a default deny policy.
