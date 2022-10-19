# Délelőtt 9 és 12 óra közti időt tartalmazó sorokat keresse
grep -E --color=always '(09|1[0-1])\:[0-9]{2}\:[0-9]{2}' auth.log

# Március 10. előtti dátumot tartalmazó sorokat keresse
grep -E --color=always '^[A-Z][a-z]+[[:space:]][[:space:]][0-9]' auth.log

# A osztályú IP címet tartalmazó sorok (1-126.)
grep -E --color=always '[[:space:]]([1-9]|[0-9][0-9]|(1[0-1][09]|12[0-6]))\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$' auth.log

# A „POSSIBLE BREAK-IN ATTEMPT!”-et tartalmazó sorokat,
grep -E --color=always '\<POSSIBLE BREAK-IN ATTEMPT\>' auth.log | grep -E --color=always '[0][0-3]\:[0-9]{2}\:[0-9]{2}'

# Hány proftpd-t tartalmazó sor van, ahol a 172.18-al kezdődik az IP cím?
grep -E --color=always 'proftpd' auth.log | grep -E --color=always '172\.18\.' | wc -l
