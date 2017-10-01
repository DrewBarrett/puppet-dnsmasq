Facter.add(:dnsmasqversion) do
    setcode do
        Facter::Core::Execution.exec('dnsmasq -v | grep -Eo [0-9]+\'\.\'[0-9]+')
    end
end