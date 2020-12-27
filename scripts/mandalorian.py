import os
import json

BASE_PATH = './'
HOME_PATH = '~/'
CONFIG_PATH = 'config.json'

def get_config():
    with open(os.path.join(BASE_PATH, CONFIG_PATH)) as f:
        data = json.load(f)
    return data

def should_install(package_name):
    ans = input('Would you like to install {}? [y/n]: '.format(package_name))
    return ans == 'y' or ans == 'Y'

def get_cmd_key(data, key):
    return "{}\n".format('\n'.join(data[key])) if key in data else ''

def get_app_icon(data):
    path = data['icon']['path']
    properties = '[Desktop Entry]\n'
    properties += '\n'.join(data['icon']['properties'])
    return 'cat > {} <<EOL\n{}\nEOL\n'.format(path, properties)

def parse_instant_package(key):
    should_append = should_install(key)
    if should_append:
        return "showStatus \"Installing {0}\"\n{1} {0}\n\n".format(key, install_cmd)
    return ''

def parse_snap_package(key):
    should_append = should_install(key)
    if should_append:
        return "showStatus \"Installing {0}\"\n{1} {0}\n\n".format(key, install_snap_cmd)
    return ''

def parse_cmd(key, data):
    out = ''
    should_append = should_install(key)
    if should_append:
        out = 'showStatus "Installing {}"\n'.format(key)
        out += get_cmd_key(data, 'before_install')

        if "pre_install" in data:
            out += "{} {}\n".format(pre_install_cmd, data["pre_install"])

        if 'package_list' in data:
            for i in data['package_list']:
                out += '{} {}\n'.format(install_cmd, i)

        out += get_cmd_key(data, 'after_install')

        if 'icon' in data:
            out += "\nshowStatus \"Adding {} icon\"\n{}\n".format(key, get_app_icon(data))
    return out

config = get_config()
installer_data = '''
#!/bin/bash

cd ~/Downloads

function showStatus() {
    printf "\\n${1}\\n"
}

'''

pre_install_cmd = config['cmds']['pre_install']
install_cmd = config['cmds']['install']
install_snap_cmd = config['cmds']['snap']

all_keys = [i['key'] for i in config['packages']] + config['instant_packages']
print(','.join(all_keys))
for package in config['packages']:
    package_name = package['key']
    package_data = package['data']
    installer_data += "{}\n".format(parse_cmd(package_name, package_data))

for package in config['instant_packages']:
    installer_data += parse_instant_package(package)

for package in config['snap_packages']:
    installer_data += parse_snap_package(package)

with open('installer.sh', 'w') as writer:
    writer.write(installer_data.strip())
