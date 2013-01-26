apt-get install -y curl

/opt/chef/embedded/bin/ruby -e "$(curl -fsSkL raw.github.com/jamie-ci/jr/go)"

mkdir -p /opt/jr/suites/shunit2
cat > /opt/jr/suites/shunit2/dummy_test.sh <<SCRIPT
test_pass()
{
  assertEquals "squeeee" "squeeee"
}
SCRIPT

mkdir -p /opt/jr/plugins
[ -e /opt/jr/plugins/shunit2 ] || ln -s /vagrant /opt/jr/plugins/shunit2
/opt/jr/bin/jr sh-shell /opt/jr/plugins/shunit2/install.sh

