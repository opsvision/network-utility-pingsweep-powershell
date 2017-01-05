# network-utility-pingsweep-powershell
Network Pingsweep to find latency.

Author: Jeremiah Owen

Purpose: To identify latency of nodes based off of a csv input.

Use: Input nodes into input.txt and seperate each with a `,`. An example is included in the repo. To execute the script open up powershell as Admin and run `powershell -ExecutionPolicy ByPass -File .\pingsweep.ps1`

_Note: This uses ICMP with 5 tries and a loaded buffersize of 15000_
