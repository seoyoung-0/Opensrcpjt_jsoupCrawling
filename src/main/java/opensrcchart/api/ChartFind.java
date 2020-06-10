package opensrcchart.api;

import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

@WebServlet("/ChartFind")
public class ChartFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String inputYear=request.getParameter("year");
		
		JSONObject JsonResult = getChart(inputYear);
		String returnResult=JsonResult.toJSONString();
		request.setAttribute("returnResult", returnResult);
		request.getRequestDispatcher("result.jsp").forward(request, response);
		
	}
	
	protected JSONObject getChart(String year) throws IOException {
		JSONObject dataMain = new JSONObject();
		JSONArray siteJsonArray= new JSONArray();
		
		String url="https://www.genie.co.kr/chart/musicHistory?year="+year+"&category=0";
		Document doc =Jsoup.connect(url).get();
		Elements element = doc.select(".list-wrap tbody");
		Elements list = element.select(".list");
		int cnt=0;
		JSONObject jsonObject=null;
		for(Element e : list.select(".info a")) {
			
			if(cnt==0) {
				jsonObject= new JSONObject();
				jsonObject.put("title", e.text());
				cnt++;}
			else if(cnt==1) {
				jsonObject.put("artist", e.text());
				cnt++;}
			else if(cnt==2) {
				jsonObject.put("albumTitle", e.text());
				cnt++;}
			if(cnt==3) {
			siteJsonArray.add(jsonObject);
			//System.out.println(jsonObject.toString());
			cnt=0;
			}
		}
		dataMain.put("ChartArray",siteJsonArray);
		dataMain.put("year",year);
		return dataMain;
	}

}
