
within Buildings.Fluid.FMI.Validation;
package FMUs "fixme: add brief description"
  extends Modelica.Icons.Package;
annotation (preferredView="info", Documentation(info="<html>
<p>
This package contains validation models for the classes in
<a href=\"modelica://Buildings.Fluid.FMI\">
Buildings.Fluid.FMI</a>.
The test are done for different media, with and without flow
reversal, and for air with zero, one or two contaminants.
</p>
<p>
Note that most validation models contain simple input data
or systems which may not be realistic, but are useful
to validate that the models are implemented correctly.
These model outputs are stored as reference data and
used for continuous validation whenever models in the library change.
</p>
</html>"));
end FMUs;
