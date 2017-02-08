# -*- coding: utf-8 -*-

host = ''
if node['network']['interfaces'].key?('tun0')
  node['network']['interfaces']['tun0']['addresses'].each do |addr, _infos|
    host = addr
    break
  end
end

unless host.empty?
  node.override['elite'][node['lab']['user']]['tmux']['scripts']['teamserver'] = {
    path: '/home/eliot/ts',
    workdir: '/home/eliot/data',
    default_window: '0',
    windows: {
      '0' => {
        name: 'services',
        win: {
          '0' => 'split-window -h {TARGET}',
          '1' => 'select-pane {TARGET}0',
          '2' => 'split-window -v {TARGET}',
          '3' => 'select-pane {TARGET}2',
          '4' => 'split-window -v {TARGET}',
          '5' => 'select-pane {TARGET}2',
          '6' => 'split-window -v {TARGET}',
          '7' => 'select-pane {TARGET}4',
          '8' => 'split-window -v {TARGET}',
        },
        cmds: {
          '0' => 'MSFRPC_PORT=55554 MSFRPC_PASS=pentestlab msfconsole -r ~/.msf4/startup-lab.rc',
          '1' => "mitmproxy -b #{host} -p 55555 -R http://127.0.0.1:55554 --follow",
          '2' => "sleep 10s; ~/elite-stuff/dockerfiles/teamserver_custom/teamserver #{host} 55554 msf pentestlab 55553",
          '3' => "cd ~/.msf4/loot/; python3 -m http.server 4242 --bind #{host}",
          '4' => 'htop',
          '5' => 'nload',
        },
      },
    },
  }
end
