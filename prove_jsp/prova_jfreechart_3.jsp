

	<%@ page import="org.jfree.chart.ChartFactory"        %>

    <%@ page import="org.jfree.chart.ChartFrame"          %>

    <%@ page import="org.jfree.chart.JFreeChart"          %>

    <%@ page import="org.jfree.chart.plot.PlotOrientation"%>

    <%@ page import="org.jfree.data.xy.XYDataset"         %>

    <%@ page import="org.jfree.data.xy.XYSeries"          %>

    <%@ page import="org.jfree.data.xy.XYSeriesCollection"%>

    <%@ page import="org.jfree.chart.ChartUtilities"      %>

   

    <% displayGraphI(response); %>

   

    <%!

    //==================================================================================================

    //FUNCTION: displayGraphI

    //==================================================================================================

    public void displayGraphI(HttpServletResponse resp) throws Exception {

      

      //ENTER POINTS.

      XYSeries        series      = new XYSeries("Average Size");

                      series.add(20.0, 10.0);

                      series.add(40.0, 20.0);

                      series.add(70.0, 50.0);

 

      //CREATE DATASET. 

      XYDataset       xyDataset   = new XYSeriesCollection(series);

 

      //CREATE CHART.

      boolean         legend      = false;

      boolean         tooltips    = false;

      boolean         urls        = false;

      JFreeChart      chart       = ChartFactory.createXYLineChart("Sample XY Chart","Height","Weight",xyDataset, PlotOrientation.VERTICAL,legend,tooltips,urls);

   

      //CREATE OUTPUT STREAM.
      resp.setContentType("image/png");

      ChartUtilities.writeChartAsJPEG(resp.getOutputStream(),chart,1000,500);

      

    }

    %>

