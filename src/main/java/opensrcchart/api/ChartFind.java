package opensrcchart.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * Servlet implementation class ChartFind
 */
@WebServlet("/Chart")
public class ChartFind extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String inputYear=request.getParameter("year");
		getChart(inputYear);
		
	}
	
	protected void getChart(String year) throws IOException {
		String url="https://www.genie.co.kr/chart/musicHistory?year="+year+"&category=0";
		Document doc =Jsoup.connect(url).get();
		Elements element = doc.select(".list-wrap tbody");
		for(Element el : element.select(".list .info")) {
			System.out.println(el.text());
		}
	}

}
