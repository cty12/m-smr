# Setups for mysqld
# Notice :
# 1. rm /tmp/mysql.sock manually if you encounter any problems
# 2. If the subprocess call failed out of no reason, just wait awhile. 

app="mysqld"                                          # app name appears in process list
xtern=1                                               # 1 use xtern, 0 otherwise.
proxy=1                                               # 1 use proxy, 0 otherwise
sch_paxos=1                                           # 1 xtern will schedule with paxos, 0 otherwise
sch_dmt=1                                             # 1 libevent_paxos will schedule with DMT, 0 otherwise
leader_elect=0                                        # 1 enable leader election demo, 0 otherwise
checkpoint=0                                          # 1 use checkpoint on relicas, 0 otherwise
checkpoint_period=10                                  # period of CRIU checkpoint, e.g. 10 seconds
msmr_root_client="/home/ruigu/Workspace/m-smr"        # root dir for m-smr
msmr_root_server="/home/ruigu/SSD/m-smr"
input_url="127.0.0.1"                                 # url for client to query
analysis_tools=""                                     # for executing analysis tools (e.g., analysis_tools="--worker1=helgrind")

if [ $proxy -eq 1 ]
then
    client_cmd="cd ${msmr_root_client}/apps/mysql && ./client-test '128.59.17.174' '9000' && ./run-sysbench -i '128.59.17.174' -p 9000 -t 4"
else
    client_cmd="cd ${msmr_root_client}/apps/mysql && ./client-test '128.59.17.174' '7000' && ./run-sysbench -i '128.59.17.174' -p 7000 -t 4"
fi
                                                      # command to start the clients
server_cmd="'cd ${msmr_root_server}/apps/mysql && ./start-mysqld'"
                                                      # command to start the real server
