using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowGoogleMap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtlat.Value = Request.QueryString["lataddress"].ToString();
        txtlong.Value = Request.QueryString["longaddress"].ToString();


        //AIzaSyAnn69kTtwMIr4LsI2ve7qNtSTYh3qkTzo
        //AIzaSyAnn69kTtwMIr4LsI2ve7qNtSTYh3qkTzo
    }




    //protected void FindCoordinates(object sender, EventArgs e)
    //{
    //    string url = "http://maps.google.com/maps/api/geocode/xml?address=" + txtLocation.Text + "&sensor=false";
    //    WebRequest request = WebRequest.Create(url);
    //    using (WebResponse response = (HttpWebResponse)request.GetResponse())
    //    {
    //        using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
    //        {
    //            DataSet dsResult = new DataSet();
    //            dsResult.ReadXml(reader);
    //            DataTable dtCoordinates = new DataTable();
    //            dtCoordinates.Columns.AddRange(new DataColumn[4] { new DataColumn("Id", typeof(int)),
    //                new DataColumn("Address", typeof(string)),
    //                new DataColumn("Latitude",typeof(string)),
    //                new DataColumn("Longitude",typeof(string)) });
    //            foreach (DataRow row in dsResult.Tables["result"].Rows)
    //            {
    //                string geometry_id = dsResult.Tables["geometry"].Select("result_id = " + row["result_id"].ToString())[0]["geometry_id"].ToString();
    //                DataRow location = dsResult.Tables["location"].Select("geometry_id = " + geometry_id)[0];
    //                dtCoordinates.Rows.Add(row["result_id"], row["formatted_address"], location["lat"], location["lng"]);
    //            }
    //            if (dtCoordinates.Rows.Count > 0)
    //            {
    //                pnlScripts.Visible = true;
    //                hdn_lat.Value = "";
    //                hdn_long.Value = "";
    //            }
    //        }
    //    }
    //}







}