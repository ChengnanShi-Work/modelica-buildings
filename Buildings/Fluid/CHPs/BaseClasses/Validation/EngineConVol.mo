within Buildings.Fluid.CHPs.BaseClasses.Validation;
model EngineConVol "Validate model EngineConVol"

  parameter Buildings.Fluid.CHPs.Data.ValidationData1 per
    "CHP performance data"
    annotation (Placement(transformation(extent={{60,60},{80,80}})));

  Buildings.Fluid.CHPs.BaseClasses.EngineConVol eng(
    final per=per,
    final TEngIni=273.15 + 20)
    "Heat exchange within the engine control volume"
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Ramp QGen(
    final height=5000,
    final duration=360,
    final offset=0,
    final startTime=600) "Heat generation within the engine"
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant TRoo(
    final k=273.15 + 15)
    "Room temperature"
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant TWat(
    final k=273.15 + 60)
    "Water temperature"
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));

protected
  Buildings.HeatTransfer.Sources.PrescribedTemperature preTem
    "Room temperature"
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Buildings.HeatTransfer.Sources.PrescribedTemperature preTem1
    "Room temperature"
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));

equation
  connect(QGen.y, eng.QGen) annotation (Line(points={{-38,10},{38,10}},
          color={0,0,127}));
  connect(preTem.port, eng.TRoo) annotation (Line(points={{0,50},{20,50},{20,
          15.8},{40,15.8}}, color={191,0,0}));
  connect(preTem.T, TRoo.y) annotation (Line(points={{-22,50},{-38,50}},
          color={0,0,127}));
  connect(preTem1.T, TWat.y) annotation (Line(points={{-22,-30},{-38,-30}},
          color={0,0,127}));
  connect(preTem1.port,eng.TWat) annotation (Line(points={{0,-30},{20,-30},{20,
          4},{40,4}}, color={191,0,0}));

annotation (
    experiment(StopTime=1500, Tolerance=1e-6),
    __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Fluid/CHPs/BaseClasses/Validation/EngineConVol.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This example validates
<a href=\"modelica://Buildings.Fluid.CHPs.BaseClasses.EngineConVol\">
Buildings.Fluid.CHPs.BaseClasses.EngineConVol</a>
for defining the heat exchange within the engine control volume. 
</p>
</html>", revisions="<html>
<ul>
<li>
July 01 2019, by Tea Zakula:<br/>
First implementation.
</li>
</ul>
</html>"),
    Icon(graphics={Ellipse(
          lineColor={75,138,73},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}), Polygon(
          lineColor={0,0,255},
          fillColor={75,138,73},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-36,60},{64,0},{-36,-60},{-36,60}})}));
end EngineConVol;
