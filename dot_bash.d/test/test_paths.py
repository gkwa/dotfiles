import subprocess


def test_bash_version():
    cmd = "bash --version"
    ps = subprocess.Popen(
        cmd,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT)
    output = ps.communicate()[0]
    assert 'GNU bash' in output.decode('ascii')

def test_gnu_bash_in_manpath():
    cmd = "man bash"
    ps = subprocess.Popen(
        cmd,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT)
    output = ps.communicate()[0]
    assert 'GNU Bourne-Again SHell' in output.decode('ascii')


def test_gnu_xargs_in_manpath():
    cmd = "man xargs"
    ps = subprocess.Popen(
        cmd,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT)
    output = ps.communicate()[0]
    assert 'gnu.org' in output.decode('ascii')
    assert ' GNU version ' in output.decode('ascii')


def test_r_arg():
    """verify you're using gnu xargs"""
    cmd = "echo hello | xargs -r"
    ps = subprocess.Popen(
        cmd,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT)
    output = ps.communicate()[0]
    assert 'illegal option -- r' not in output.decode('ascii')


def test_wrong_xargs_has_expected_error_message():
    """verify the wrong xargs has expected error message"""
    cmd = "echo hello | /usr/bin/xargs -r"
    ps = subprocess.Popen(
        cmd,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT)
    output = ps.communicate()[0]
    assert 'illegal option -- r' in output.decode('ascii')
