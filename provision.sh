apt-get install -y curl

/opt/chef/embedded/bin/ruby -e "$(curl -fsSkL https://raw.github.com/opscode/kb/go)"

mkdir -p /opt/kb/suites/shunit2
cat > /opt/kb/suites/shunit2/dummy_test.sh <<SCRIPT
test_pass()
{
  assertEquals "squeeee" "squeeee"
}
SCRIPT

mkdir -p /opt/kb/plugins
[ -e /opt/kb/plugins/shunit2 ] || ln -s /vagrant /opt/kb/plugins/shunit2
/opt/kb/bin/kb sh-shell /opt/kb/plugins/shunit2/install.sh

