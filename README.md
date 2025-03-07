# Modelica Buildings library

[![Build Status](https://travis-ci.com/lbl-srg/modelica-buildings.svg?branch=master)](https://travis-ci.com/lbl-srg/modelica-buildings)

This is the development site for the Modelica _Buildings_ library and its user guide.

Stable releases including all previous releases are available from the main project site
at http://simulationresearch.lbl.gov/modelica.

Instructions for developers are available on the [wiki](https://github.com/lbl-srg/modelica-buildings/wiki).

## Library description

The Modelica Buildings library is a free open-source library with dynamic simulation models for building energy and control systems. The library contains models for
- air-based HVAC systems,
- water-based heating systems,
- controls,
- heat transfer among rooms and the outside,
- multizone airflow, including natural ventilation and contaminant transport, and
- electrical systems.


The main project site is http://simulationresearch.lbl.gov/modelica.

## Current release

Download [Buildings Library 8.0.0 (2021-06-08)](https://github.com/lbl-srg/modelica-buildings/releases/download/v8.0.0/Buildings-v8.0.0.zip)

## License

The Modelica _Buildings_ Library is available under a 3-clause BSD-license.
See [Modelica Buildings Library license](https://htmlpreview.github.io/?https://github.com/lbl-srg/modelica-buildings/blob/master/Buildings/legal.html).

Python modules are available under a 3-clause BSD-license. See [BuildingsPy license](http://simulationresearch.lbl.gov/modelica/buildingspy/legal.html).

## Development and contribution
You may report any issues with using the [Issues](https://github.com/lbl-srg/modelica-buildings/issues) button.

Contributions in the form of [Pull Requests](https://github.com/lbl-srg/modelica-buildings/pulls) are always welcome.
Prior to issuing a pull request, make sure your code follows the [style guide and coding conventions](https://github.com/lbl-srg/modelica-buildings/wiki/Style-Guide).

## Building binaries

The distribution at https://simulationresearch.lbl.gov/modelica/download.html
contains all binaries.

Developers may build the binaries as follows.

### Spawn of EnergyPlus

The Buildings library already contains the compiled binaries that are needed to link to EnergyPlus.

To rebuild the Spawn of EnergyPlus binaries, CMake is required. The binaries
consist of the fmi-library, and a library that connects Modelica to EnergyPlus.

To build the fmi-library, which is only needed if https://github.com/modelon-community/fmi-library is updated, run
```
cd Buildings/Resources/src/fmi-library
rm -rf build && mkdir build && \
  cd build && cmake .. && cmake --build . && \
  cd .. && rm -rf build
```

To build the Modelica to EnergyPlus library, run
```
cd modelica-buildings
rm -rf build && mkdir build && cd build && \
  cmake ../ && cmake --build . --target install && \
  cd .. && rm -rf build
```

To install the latest build of EnergyPlus that contains the Spawn interface, run
```
cd Buildings/Resources/src/ThermalZones/EnergyPlus/
./install.py
```
