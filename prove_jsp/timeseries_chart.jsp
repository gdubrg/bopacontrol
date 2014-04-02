<%@page language="java"%>

<%@ page import ="java.awt.Color" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="javax.swing.JPanel" %>
<%@ page import ="org.jfree.chart.ChartFactory" %>
<%@ page import ="org.jfree.chart.ChartPanel" %>
<%@ page import ="org.jfree.chart.JFreeChart" %>
<%@ page import ="org.jfree.chart.axis.DateAxis" %>
<%@ page import ="org.jfree.chart.plot.XYPlot" %>
<%@ page import ="org.jfree.chart.renderer.xy.XYItemRenderer" %>
<%@ page import ="org.jfree.chart.renderer.xy.XYLineAndShapeRenderer" %>
<%@ page import ="org.jfree.data.time.Month" %>
<%@ page import ="org.jfree.data.time.TimeSeries" %>
<%@ page import ="org.jfree.data.time.TimeSeriesCollection" %>
<%@ page import ="org.jfree.data.xy.XYDataset" %>
<%@ page import ="org.jfree.ui.ApplicationFrame" %>
<%@ page import ="org.jfree.ui.RectangleInsets" %>
<%@ page import ="org.jfree.ui.RefineryUtilities" %>
<%@ page import="org.jfree.chart.ChartUtilities"      %>


<%

TimeSeries s1 = new TimeSeries("L&G European Index Trust", Month.class);
s1.add(new Month(2, 2001), 181.8);
s1.add(new Month(3, 2001), 167.3);
s1.add(new Month(4, 2001), 153.8);
s1.add(new Month(5, 2001), 167.6);
s1.add(new Month(6, 2001), 158.8);
s1.add(new Month(7, 2001), 148.3);
s1.add(new Month(8, 2001), 153.9);
s1.add(new Month(9, 2001), 142.7);
s1.add(new Month(10, 2001), 123.2);
s1.add(new Month(11, 2001), 131.8);
s1.add(new Month(12, 2001), 139.6);
s1.add(new Month(1, 2002), 142.9);
s1.add(new Month(2, 2002), 138.7);
s1.add(new Month(3, 2002), 137.3);
s1.add(new Month(4, 2002), 143.9);
s1.add(new Month(5, 2002), 139.8);
s1.add(new Month(6, 2002), 137.0);
s1.add(new Month(7, 2002), 132.8);

TimeSeries s2 = new TimeSeries("L&G UK Index Trust", Month.class);
s2.add(new Month(2, 2001), 129.6);
s2.add(new Month(3, 2001), 123.2);
s2.add(new Month(4, 2001), 117.2);
s2.add(new Month(5, 2001), 124.1);
s2.add(new Month(6, 2001), 122.6);
s2.add(new Month(7, 2001), 119.2);
s2.add(new Month(8, 2001), 116.5);
s2.add(new Month(9, 2001), 112.7);
s2.add(new Month(10, 2001), 101.5);
s2.add(new Month(11, 2001), 106.1);
s2.add(new Month(12, 2001), 110.3);
s2.add(new Month(1, 2002), 111.7);
s2.add(new Month(2, 2002), 111.0);
s2.add(new Month(3, 2002), 109.6);
s2.add(new Month(4, 2002), 113.2);
s2.add(new Month(5, 2002), 111.6);
s2.add(new Month(6, 2002), 108.8);
s2.add(new Month(7, 2002), 101.6);


TimeSeriesCollection dataset = new TimeSeriesCollection();
dataset.addSeries(s1);
dataset.addSeries(s2);
dataset.setDomainIsPointsInTime(true);

JFreeChart chart = ChartFactory.createTimeSeriesChart(
"Legal & General Unit Trust Prices", // title
"Date",
// x-axis label
"Price Per Unit",
// y-axis label
dataset,
// data
true,true,false);

chart.setBackgroundPaint(Color.white);
XYPlot plot = (XYPlot) chart.getPlot();
plot.setBackgroundPaint(Color.lightGray);
plot.setDomainGridlinePaint(Color.white);
plot.setRangeGridlinePaint(Color.white);
plot.setAxisOffset(new RectangleInsets(5.0, 5.0, 5.0, 5.0));
plot.setDomainCrosshairVisible(true);
plot.setRangeCrosshairVisible(true);
XYItemRenderer r = plot.getRenderer();
if (r instanceof XYLineAndShapeRenderer) {
XYLineAndShapeRenderer renderer = (XYLineAndShapeRenderer) r;
renderer.setBaseShapesVisible(true);
renderer.setBaseShapesFilled(true);
}
DateAxis axis = (DateAxis) plot.getDomainAxis();
axis.setDateFormatOverride(new SimpleDateFormat("MMM-yyyy"));



//CREATE OUTPUT STREAM.
response.setContentType("image/png");
ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,1000,500);



%>

