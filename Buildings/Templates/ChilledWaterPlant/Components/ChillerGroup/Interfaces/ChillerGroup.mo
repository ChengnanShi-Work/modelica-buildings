within Buildings.Templates.ChilledWaterPlant.Components.ChillerGroup.Interfaces;
partial model ChillerGroup
//   extends Buildings.Fluid.Interfaces.PartialOptionalFourPortInterface(
//     redeclare package Medium1=Buildings.Media.Water,
//     redeclare package Medium2=Buildings.Media.Water,
//     final hasMedium1=not is_airCoo,
//     final hasMedium2=true);

  parameter Boolean is_airCoo
    "= true, chillers in group are air cooled, 
    = false, chillers in group are water cooled";

  parameter Integer num = 2 "Number of chillers in group";

  replaceable package Medium1 = Buildings.Media.Water
    constrainedby Modelica.Media.Interfaces.PartialMedium "Medium 1 in the component"
      annotation (Dialog(enable=not is_airCoo));
  replaceable package Medium2 = Buildings.Media.Water
    constrainedby Modelica.Media.Interfaces.PartialMedium "Medium 2 in the component";

  parameter Boolean allowFlowReversal1 = true
    "= false to simplify equations, assuming, but not enforcing, no flow reversal for medium 1"
    annotation(Dialog(tab="Assumptions", enable=not is_airCoo), Evaluate=true);
  parameter Boolean allowFlowReversal2 = true
    "= false to simplify equations, assuming, but not enforcing, no flow reversal for medium 2"
    annotation(Dialog(tab="Assumptions"), Evaluate=true);

  Modelica.Fluid.Interfaces.FluidPorts_a ports_a1[num](
    redeclare final package Medium = Medium1,
    m_flow(min=if allowFlowReversal1 then -Modelica.Constants.inf else 0),
    h_outflow(start=Medium1.h_default, nominal=Medium1.h_default))
    if not is_airCoo
    "Fluid connectors a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-108,28},{-92,92}}),
        iconTransformation(extent={{-108,28},{-92,92}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(
    redeclare final package Medium = Medium1,
    m_flow(max=if allowFlowReversal1 then +Modelica.Constants.inf else 0),
    h_outflow(start = Medium1.h_default, nominal = Medium1.h_default)) if not is_airCoo
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{110,50},{90,70}})));

  Modelica.Fluid.Interfaces.FluidPort_a port_a2(
    redeclare final package Medium = Medium2,
    m_flow(min=if allowFlowReversal2 then -Modelica.Constants.inf else 0),
    h_outflow(start = Medium2.h_default, nominal = Medium2.h_default))
    "Fluid connector a2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2(
    redeclare final package Medium = Medium2,
    m_flow(max=if allowFlowReversal2 then +Modelica.Constants.inf else 0),
    h_outflow(start = Medium2.h_default, nominal = Medium2.h_default)) if typ == Buildings.Templates.Types.ChillerGroup.ChillerSeries
    "Fluid connector b2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{-90,-70},{-110,-50}})));

  Modelica.Fluid.Interfaces.FluidPorts_b ports_b2[num](
    redeclare each final package Medium = Medium2,
    each m_flow(max=if allowFlowReversal2 then +Modelica.Constants.inf else 0),
    each h_outflow(start=Medium2.h_default, nominal=Medium2.h_default)) if typ == Buildings.Templates.Types.ChillerGroup.ChillerParallel
    "Fluid connector b2 for multiple outlets (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{-92,-32},{-108,32}}),
        iconTransformation(extent={{8,-32},{-8,32}},
        rotation=270,
        origin={-60,-100})));

  parameter Modelica.SIunits.MassFlowRate m1_flow_nominal(min=0)
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition", enable=not is_airCoo));
  parameter Modelica.SIunits.MassFlowRate m2_flow_nominal(min=0)
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Medium1.MassFlowRate m1_flow_small(min=0) = 1E-4*abs(m1_flow_nominal)
    "Small mass flow rate for regularization of zero flow"
    annotation(Dialog(tab = "Advanced", enable=not is_airCoo));
  parameter Medium2.MassFlowRate m2_flow_small(min=0) = 1E-4*abs(m2_flow_nominal)
    "Small mass flow rate for regularization of zero flow"
    annotation(Dialog(tab = "Advanced"));

  parameter Buildings.Types.ChillerGroup typ "Type of chiller group"
    annotation (Evaluate=true, Dialog(group="Configuration"));
  // ToDo: Other ChillerGroup parameters

  outer parameter String id
    "System identifier";
  outer parameter ExternData.JSONFile dat
    "External parameter file";

  BaseClasses.Bus busCon "Control bus"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={0,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,100})));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false),
    graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ChillerGroup;
