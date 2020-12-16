within Buildings.Experimental.DHC.Examples.Combined.Generation5.Unidirectional.Examples;
model ParallelConstantFlow
  "Example of parallel connection with constant district water mass flow rate"
  extends BaseClasses.PartialParallel(
    redeclare Loads.BuildingTimeSeriesWithETS bui[nBui](
      final filNam=filNam),
    nBui=3);
  parameter String filNam[nBui]={
    "modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissOffice_20190916.mos",
    "modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissResidential_20190916.mos",
    "modelica://Buildings/Resources/Data/Experimental/DHC/Loads/Examples/SwissHospital_20190916.mos"}
    "Library paths of the files with thermal loads as time series";
  Modelica.Blocks.Sources.Constant masFloMaiPum(
    k=datDes.mDis_flow_nominal)
    "Distribution pump mass flow rate"
    annotation (Placement(transformation(extent={{-280,-70},{-260,-50}})));
  Modelica.Blocks.Sources.Constant masFloDisPla(k=datDes.mPla_flow_nominal)
    "District water mass flow rate to plant"
    annotation (Placement(transformation(extent={{-250,10},{-230,30}})));
  Controls.OBC.CDL.Continuous.Sources.Constant THotWatSupSet[nBui](k=fill(63 +
        273.15, nBui)) "Service hot water supply temperature set point"
    annotation (Placement(transformation(extent={{-220,170},{-200,190}})));
  Controls.OBC.CDL.Continuous.Sources.Constant TColWat[nBui](k=fill(15 + 273.15,
        nBui)) "Cold water temperature"
    annotation (Placement(transformation(extent={{-190,150},{-170,170}})));
equation
  connect(masFloMaiPum.y, pumDis.m_flow_in) annotation (Line(points={{-259,-60},
          {60,-60},{60,-60},{68,-60}}, color={0,0,127}));
  connect(pumSto.m_flow_in, masFloMaiPum.y) annotation (Line(points={{-180,-68},
          {-180,-60},{-259,-60}}, color={0,0,127}));
  for i in 1:nBui loop
  end for;
  connect(masFloDisPla.y, pla.mPum_flow) annotation (Line(points={{-229,20},{
          -184,20},{-184,4},{-162,4}},
                                  color={0,0,127}));
  connect(dis.port_bDisSup, dis.port_aDisRet) annotation (Line(points={{20,140},
          {40,140},{40,134},{20,134}}, color={0,127,255}));
  connect(THotWatSupSet.y, bui.THotWatSupSet) annotation (Line(points={{-198,
          180},{-24,180},{-24,176},{-11,176}}, color={0,0,127}));
  connect(TColWat.y, bui.TColWat) annotation (Line(points={{-168,160},{-24,160},
          {-24,172},{-11,172}}, color={0,0,127}));
  annotation (
  Diagram(
  coordinateSystem(preserveAspectRatio=false, extent={{-360,-260},{360,260}})),
    __Dymola_Commands(
  file="modelica://Buildings/Resources/Scripts/Dymola/Experimental/DHC/Examples/Combined/Generation5/Unidirectional/Examples/ParallelConstantFlow.mos"
  "Simulate and plot"),
  experiment(
    StopTime=604800,
    Tolerance=1e-06));
end ParallelConstantFlow;
