﻿//*******************************************************************************
//Copyright 2015 TIIS - Tanzania Immunization Information System
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.
 //******************************************************************************
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GIIS.DataLayer;
using System.IO;
using System.Text;
using System.Data;
using System.Globalization;

public partial class Pages_PrintPlannedCoverageReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.IsPostBack)
        {
            List<string> actionList = null;
            string sessionNameAction = "";
            if (CurrentEnvironment.LoggedUser != null)
            {
                sessionNameAction = "__GIS_actionList_" + CurrentEnvironment.LoggedUser.Id;
                actionList = (List<string>)Session[sessionNameAction];
            }

            if ((actionList != null) && actionList.Contains("PlannedCoverageReport") && (CurrentEnvironment.LoggedUser != null))
            {
                int userId = CurrentEnvironment.LoggedUser.Id;
                string language = CurrentEnvironment.Language;
                int languageId = int.Parse(language);
                Dictionary<string, string> wtList = (Dictionary<string, string>)HttpContext.Current.Cache["PlannedCoverageReport-dictionary" + language + language];
                if (wtList == null)
                {
                    List<WordTranslate> wordTranslateList = WordTranslate.GetWordByLanguage(languageId, "PlannedCoverageReport");
                    wtList = new Dictionary<string, string>();
                    foreach (WordTranslate vwt in wordTranslateList)
                        wtList.Add(vwt.Code, vwt.Name);
                    HttpContext.Current.Cache.Insert("PlannedCoverageReport-dictionary" + language + language, wtList);
                }

                //controls
                this.lbFromDate.Text = wtList["PlannedCoverageReportFromDate"];
                this.lbToDate.Text = wtList["PlannedCoverageReportToDate"];
                this.lbEndDate.Text = wtList["PlannedCoverageReportEndDate"];
                this.lbVaccine.Text = wtList["PlannedCoverageReportVaccine"];

                this.lblTitle.Text = wtList["PlannedCoverageReportPageTitle"];

                int hfId = CurrentEnvironment.LoggedUser.HealthFacilityId;
                string _hfId = (string)Request.QueryString["hfId"];
                if (!String.IsNullOrEmpty(_hfId))
                    int.TryParse(_hfId, out hfId);
                HttpContext.Current.Session["hfId"] = hfId;
                string healthFacilityId = "1";
                if (hfId != 1)
                    healthFacilityId = HealthFacility.GetAllChildsForOneHealthFacility(hfId, true);

                lblFromDate.Text = HttpContext.Current.Session["fromdate"].ToString();
                lblToDate.Text = HttpContext.Current.Session["todate"].ToString();
                lblEndDate.Text = HttpContext.Current.Session["enddate"].ToString();
                int vaccine = Helper.ConvertToInt(HttpContext.Current.Session["vaccineId"]);
                int domicile = int.Parse(HttpContext.Current.Session["domicile"].ToString());
                if (vaccine != -1)
                {
                    Dose o =  Dose.GetDoseById(vaccine);
                    lblVaccine.Text = o.Fullname ;
                }
                
                string dateFormat = ConfigurationDate.GetConfigurationDateById(int.Parse(Configuration.GetConfigurationByName("DateFormat").Value)).DateFormat.ToString();

                DateTime datefrom = DateTime.ParseExact(lblFromDate.Text, dateFormat, CultureInfo.CurrentCulture);
                DateTime dateto = DateTime.ParseExact(lblToDate.Text, dateFormat, CultureInfo.CurrentCulture);
                DateTime dateend = DateTime.ParseExact(lblEndDate.Text, dateFormat, CultureInfo.CurrentCulture);

                DataTable dt = CohortCoverage.GetPlannedCoverage(languageId, healthFacilityId, datefrom, dateto, dateend, vaccine, domicile); 
                DataTable table = CreateDataTable(dt);

                 if (dt != null)
                 {
                     char[] stringSeparators = new char[] { ',' };
                     string[] result;
                     foreach (DataRow dr in dt.Rows)
                     {
                         result = dr[0].ToString().Replace(" ", "").Replace("(", "").Replace(")", "").Replace("\"", "").Split(stringSeparators);
                         CreateDataRow(result, table);
                     }

                     gvPlannedCoverage.DataSource = table;
                     gvPlannedCoverage.DataBind();
                 }
  
            }
            else
                Response.Redirect("Default.aspx", false);
        }
    }
    
    private DataTable CreateDataTable(DataTable dt)
    {
        DataTable table = new DataTable();
        
        DataColumn col0 = new DataColumn("View Not Vaccinated Children");
        DataColumn vId = new DataColumn("VaccineId");
        DataColumn col1 = new DataColumn("Vaccine");
        DataColumn col2 = new DataColumn("Planned");
        DataColumn col3 = new DataColumn("Immunized");
        DataColumn col4 = new DataColumn("Vaccination Coverage");

        col0.DataType = System.Type.GetType("System.String");
        vId.DataType = System.Type.GetType("System.String");
        col1.DataType = System.Type.GetType("System.String");
        col2.DataType = System.Type.GetType("System.String");
        col3.DataType = System.Type.GetType("System.String");
        col4.DataType = System.Type.GetType("System.String");

        table.Columns.Add(col0); 
        table.Columns.Add(vId);        
        table.Columns.Add(col1);
        table.Columns.Add(col2);
        table.Columns.Add(col3);
        table.Columns.Add(col4);

        List<NonvaccinationReason> nvrList = NonvaccinationReason.GetNonvaccinationReasonList();
        foreach (NonvaccinationReason nvr in nvrList)
        {
            DataColumn col = new DataColumn(nvr.Name);
            col.DataType = System.Type.GetType("System.String");
            table.Columns.Add(col);
        }

        return table;
    }

    private DataRow CreateDataRow(string[] result, DataTable table)
    {
        DataRow row = table.NewRow();

        string planned = "", immunized = "";
        int index = 1;
        string dateFormat = ConfigurationDate.GetConfigurationDateById(int.Parse(Configuration.GetConfigurationByName("DateFormat").Value)).DateFormat.ToString();
        DateTime dateto = DateTime.ParseExact(lblToDate.Text, dateFormat, CultureInfo.CurrentCulture);

        foreach (string word in result)
        {
            if (index == 5)
            {
                index++;
                row[index] = word;
            }

            row[index] = word;

            if (index == 3)
            {
                planned = word;
                if (planned == "0")
                {
                    HealthFacilityCohortData hfplanned = HealthFacilityCohortData.GetHealthFacilityCohortDataByYearAndHealthFacility(CurrentEnvironment.LoggedUser.HealthFacilityId, dateto.Year);
                    if (hfplanned != null)
                    {
                        planned = hfplanned.Cohort.ToString();
                        row[3] = planned;
                    }
                }
            }
            if (index == 4) immunized = word;

            index++;
        }

        row[0] = (int.Parse(planned) - int.Parse(immunized));//View Not Vaccinated Children
        if (planned != "0")
        {
            int i = int.Parse(immunized);
            int c = int.Parse(planned);
            double r = (double)i / c;
            row[5] = (r * 100).ToString("0.00") + "  %";//Vaccination Coverage
        }
        else row[5] = "0 %";

        table.Rows.Add(row);

        return row;
    }

    protected void gvPlannedCoverage_DataBound(object sender, EventArgs e)
    {
        if (gvPlannedCoverage.Rows.Count > 0)
        {
            foreach (GridViewRow gvr in gvPlannedCoverage.Rows)
            {
                gvr.Cells[1].Visible = false;
            }
            gvPlannedCoverage.HeaderRow.Cells[1].Visible = false;
        }
        
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //Verifies that the control is rendered
    }
}