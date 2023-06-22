using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    private SqlConnection objConnection = null;
    private SqlCommand objCommand = null;

    IFormatProvider dateformat = new System.Globalization.CultureInfo("en-GB");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsLogin"] == null)
        {
            Session["IsLogin"] = "false";
        }

        if (Session["IsLogin"].ToString() != "true")
        {
            Response.Redirect("~/");
        }


        if (!IsPostBack)
        {
            bindLocation();

            p_Note.Visible = false;
        }


    }

    private void bindLocation()
    {
        DataTable dt = new DataTable();
        objConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        objConnection.Open();
        objCommand = new SqlCommand(@"select ID, LocationName from LocationMaster", objConnection);
        
        SqlDataAdapter sda = new SqlDataAdapter(objCommand);
        
        sda.Fill(dt);
        ddlLocation.DataSource = dt;
        ddlLocation.DataTextField = "LocationName";
        ddlLocation.DataValueField = "ID";
        ddlLocation.DataBind();
        ddlLocation.Items.Insert(0, new ListItem("Select", "0"));

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlLocation.SelectedValue != "0" && txtdisease.Text.Trim().ToString() != "")
            {
                BindGrid(ddlLocation.SelectedValue.ToString(), txtdisease.Text.Trim().ToString());
            }
        }
        catch (Exception ex)
        {

        }
    }

    private void BindGrid(string LocationId, string strDisease)
    {
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            //using (SqlCommand cmd = new SqlCommand(@"select MM.MedicineName, MM.DiseaseID, DM.DoctorName, DM.Address, dis.Symptoms
            //                                            from MedicineMaster MM
            //                                            left join DiseaseMaster dis on MM.DiseaseID = dis.DiseaseId
            //                                            left join DoctorMaster DM on dis.DoctorID = DM.ID  where DM.LocationId = " + LocationId + " and dis.DiseaseName like '%" + strDisease + "%' "))

            using (SqlCommand cmd = new SqlCommand(@"select dis.DiseaseName, MM.MedicineName, MM.DiseaseID, DM.DoctorName, DM.Address, dis.Symptoms
                                                    ,DM.LatAddress, DM.LongAddress, dis.Precautions
                                                    from MedicineMaster MM
                                                    left join DiseaseMaster dis on MM.DiseaseID = dis.DiseaseId
                                                    left join DoctorMaster DM on dis.DoctorID = DM.ID  where DM.LocationId = " + LocationId + " and lower(dis.Symptoms) like '%" + strDisease.ToString().Trim().ToLower() + "%' "))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            spanErrorMsg.InnerText = "";

                            p_Note.Visible = true;
                        }
                        else
                        {
                            GridView1.DataSource = null;
                            GridView1.DataBind();
                            spanErrorMsg.InnerText = "No record found";
                        }
                    }
                }
            }
        }
    }


    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }

    protected void Display(object sender, EventArgs e) 
    {
        int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);
        GridViewRow row = GridView1.Rows[rowIndex];


        //pSymptoms.InnerHtml = (row.FindControl("pSymptoms") as Label).Text;
        Response.Redirect("~/ShowGoogleMap.aspx?lataddress=" + (row.FindControl("lblLat") as Label).Text + "&longaddress=" + (row.FindControl("lblLong") as Label).Text);

        //lblmonth.Text = (row.FindControl("lblMonth_Name") as Label).Text; ;
        //txtAmount.Text = (row.FindControl("lblAmount") as Label).Text;
        //ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
    }

}