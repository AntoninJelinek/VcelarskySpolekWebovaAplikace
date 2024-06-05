<h1> ASP.NET MVC Implementation of Web Application for Local Beekeepers Association</h1>
<b>The following app description will be extended in the future.</b>
<p>This repository includes my web app as part of my bachelors thesis. </p>

<h2>How to setup</h2>
<ol>
  <li>In first, import the <code>dbspolek 2.sql</code> file into your MySQL database (I recommend use phpMyAdmin for this).</li>
  <li>In the application, open <code>Context.cs</code> file inside <code>Model</code> folder and change the following string in the <code>OnConfiguring</code> method:</li>
  <pre>
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
  {
    optionsBuilder.UseMySQL("server=YOURSERVERIP;database=YOURDATABASENAME;user=YOURUSERNAME;password=YOURPASSWORD");
  }
  </pre>
  <li>The string must be edit in according to your imported file from step one.</li>
</ol>
<h2>User accounts</h2>
<h3>User 1</h3>
<p>
  Username: tondaaaaaa<br>
  Password: Heslo123
</p>
<h3>User 2</h3>
<p>
  Username: pepa<br>
  Password: MojeHeslo
</p>
<h3>User 3</h3>
<p>
  Username: marta16<br>
  Password: PejsekKocickaVariliDort
</p>
