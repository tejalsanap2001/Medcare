<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ContentPlaceHolderID="head" runat="server" ID="headerholder">
    <%--<script src="http://code.jquery.com/jquery-1.10.2.js"></script>--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>
    <!-- Optional theme -->
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">--%>
    <!-- Latest compiled and minified JavaScript -->
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>

    <script src="Scripts/myScript/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="Scripts/myScript/bootstrap.min.css">
    <link rel="stylesheet" href="Scripts/myScript/bootstrap-theme.min.css">
    <script src="Scripts/myScript/bootstrap.min.js"></script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .anchorLink{
            text-decoration:none !important;
            color:black !important;
        }
    </style>

    <h2>Search Medicine and doctors</h2>

    <%--<h3>Your application description page.</h3>--%>

    <div>
        <table style="width: 40%;">
            <tr>
                <td>
                    <asp:TextBox ID="txtdisease" placeholder="Search by Symptoms" runat="server" style="width: 92%;"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfv_disease" runat="server" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Enter disease name" 
                            ControlToValidate="txtdisease" CssClass="errMsg" ValidationGroup="Search" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:DropDownList ID="ddlLocation" runat="server">
                        <%--<asp:ListItem Value="0" Text="Select"></asp:ListItem>
                        <asp:ListItem Value="Vikhroli" Text="Vikhroli"></asp:ListItem>
                        <asp:ListItem Value="Ghatkopar" Text="Ghatkopar"></asp:ListItem>
                        <asp:ListItem Value="Vidyavihar" Text="Vidyavihar"></asp:ListItem>
                        <asp:ListItem Value="kurla" Text="kurla"></asp:ListItem>
                        <asp:ListItem Value="Chunabhatti" Text="Chunabhatti"></asp:ListItem>
                        <asp:ListItem Value="GTB" Text="GTB"></asp:ListItem>
                        <asp:ListItem Value="Vadala" Text="Vadala"></asp:ListItem>
                        <asp:ListItem Value="Dadar" Text="Dadar"></asp:ListItem>--%>
                    </asp:DropDownList><br />
                    <asp:RequiredFieldValidator ID="rfv_Location" runat="server" ControlToValidate="ddlLocation" InitialValue="0" Display="Dynamic" CssClass="errMsg" 
                        ErrorMessage="Please select location" SetFocusOnError="True" ValidationGroup="Search" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="Search" />
                </td>
            </tr>

        </table>
        <div style="height:20px;"></div>

        <div class="col-md-10">
            <h3>Medicine detail: </h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging" PageSize="10">
                <Columns>
                    <%--<asp:BoundField ItemStyle-Width="150px" DataField="MedicineName" HeaderText="Medicine Name" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="DoctorName" HeaderText="Doctor Name" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Address" HeaderText="Doctor Address" />--%>
                    <%--<asp:BoundField ItemStyle-Width="150px" DataField="Country" HeaderText="Country" />--%>
                    <%--<asp:BoundField ItemStyle-Width="150px" DataField="MedicineName" HeaderText="Medicine Name" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="DoctorName" HeaderText="Doctor Name" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Address" HeaderText="Doctor Address" />--%>
                    <asp:TemplateField HeaderText="Disease Name" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lblDisease" runat="server" Text='<%# Eval("DiseaseName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Medicine Name" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lblMedicineName" runat="server" Text='<%# Eval("MedicineName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Doctor Name" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lblDoctorName" runat="server" Text='<%# Eval("DoctorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Doctor Address" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" Visible="false" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                            <asp:Label ID="lblLat" Visible="false" runat="server" Text='<%# Eval("LatAddress") %>'></asp:Label>
                            <asp:Label ID="lblLong" Visible="false" runat="server" Text='<%# Eval("LongAddress") %>'></asp:Label>
                            <asp:LinkButton ID="lnkDetail" OnClick="Display" runat="server"><%# Eval("Address") %></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Symptoms Name" ItemStyle-Width="150px" Visible="false">
                        <ItemTemplate>
                            <asp:Label id="pSymptoms" runat="server" class="anchorLink" Text='<%# Eval("Symptoms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Precautions" ItemStyle-Width="250px">
                        <ItemTemplate>
                            <asp:Label id="pPrecaution" runat="server" Text='<%# Eval("Precautions") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <%--<asp:BoundField ItemStyle-Width="150px" DataField="Country" HeaderText="Country" />--%>
                    <%--<asp:TemplateField HeaderText="Symptoms" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDetail" OnClick="Display" runat="server">Symptoms</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>
            <span id="spanErrorMsg" runat="server"></span>

            <p style="margin-top:10px;" id="p_Note" runat="server"><b>Note: </b><span>If Patients he/she have pain persist more then 5-7 day. He/she need to consult to Doctor.</span>  </p>

        </div>
    </div>

    <!-- this is bootstrp modal popup -->
    <div id="myModal" class="modal fade">
        <div class="modal-dialog" style="left:30%;margin:30px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Symptons</h4>
                </div>
                <div class="modal-body"> <%--style="overflow-y: scroll; max-height: 85%; margin-top: 50px; margin-bottom: 50px;"--%>
                    <p id="pSymptoms" runat="server" ClientIDMode="Static"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end -->
    <script type='text/javascript'>
        function openModal() {
            $('[id*=myModal]').modal('show');
        } 
    </script>
</asp:Content>
 