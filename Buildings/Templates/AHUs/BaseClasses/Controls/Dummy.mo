within Buildings.Templates.AHUs.BaseClasses.Controls;
block Dummy "Dummy controller with constant signals"
  extends Interfaces.Controller;

  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yDamOut(k=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-180,170})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yDamRet(k=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-120,170})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yDamRel(k=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-90,170})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yCoiCooVar(k=1) if
    typCoiCoo==Types.Coil.WaterBased or
    typHexCoiCoo==Types.HeatExchanger.DXVariableSpeed
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,110})));
  Buildings.Controls.OBC.CDL.Integers.Sources.Constant yCoiCooSta(k=1) if
    typHexCoiCoo==Types.HeatExchanger.DXMultiStage
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,110})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant ySpeFanSup(k=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={120,70})));
  Buildings.Controls.OBC.CDL.Logical.Sources.Constant yFanSup(k=true)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={160,70})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yDamOutMin(k=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-150,170})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant yCoiHeaVar(k=1) if
    typCoiHea==Types.Coil.WaterBased or
    typHexCoiHea==Types.HeatExchanger.DXVariableSpeed
       annotation (Placement(
      transformation(
      extent={{-10,-10},{10,10}},
      rotation=-90,
      origin={20,110})));
equation
    // Non graphical connections - START
  connect(yCoiCooVar.y, ahuBus.ahuO.yCoiCoo);
  connect(yCoiHeaVar.y, ahuBus.ahuO.yCoiHea);
  connect(yFanSup.y, ahuBus.ahuO.yFanSup);
  // Non graphical connections - STOP
  connect(yCoiCooSta.y, ahuBus.ahuO.yCoiCoo)
    annotation (Line(points={{-20,98},{
          -20,0.1},{-200.1,0.1}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(ySpeFanSup.y, ahuBus.ahuO.ySpeFanSup) annotation (Line(points={{120,58},{
          120,50},{20,50},{20,0.1},{-200.1,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(yDamOut.y, ahuBus.ahuO.yDamOut) annotation (Line(points={{-180,158},{
          -180,0.1},{-200.1,0.1}}, color={0,0,127}));
  connect(yDamOutMin.y, ahuBus.ahuO.yDamOutMin) annotation (Line(points={{-150,
          158},{-150,0.1},{-200.1,0.1}}, color={0,0,127}));
  connect(yDamRet.y, ahuBus.ahuO.yDamRet) annotation (Line(points={{-120,158},{
          -120,0.1},{-200.1,0.1}}, color={0,0,127}));
  connect(yDamRel.y, ahuBus.ahuO.yDamRel) annotation (Line(points={{-90,158},{
          -90,0.1},{-200.1,0.1}}, color={0,0,127}));
  annotation (
  defaultComponentName="conAhu",
  Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Dummy;
