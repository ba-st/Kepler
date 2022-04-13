# Baseline Groups

Kepler includes the following groups in its Baseline that can be used as
loading targets:

- `Core` will load the minimal packages needed in a deployed application
- `Extended` Will provide a time system and notification system implementation
- `Deployment` will load all the packages needed in a deployed application
- `Tests` will load the test cases
- `Tools` will load tooling extensions
- `CI` is the group loaded in the continuous integration setup, in this
  particular case it is the same as `Tests`
- `Development` will load all the needed packages to develop and contribute to
   the project
