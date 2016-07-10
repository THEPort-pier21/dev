package com.w6.nlp;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.w6.data.Article;
import com.w6.data.Response;
import java.io.IOException;
import java.util.ArrayList;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;

public class MySolrClient 
{
    
    final private String client = "user";
    final private String password = "220895";
    final private String url = "http://" + client + ":" + password + "@" +"localhost:8983/solr/core/";   
    final private SolrClient clientSolr;
    private static final Gson gson = new GsonBuilder().create();

    
    public MySolrClient()
    {
        clientSolr = new HttpSolrClient(url);
    }
    
    public void uploadDataToSolr(
            Article article)
        throws IOException, SolrServerException
    {
        article.id = getNumberOfDocuments() + 1;
        clientSolr.add(createDocument(article));
        clientSolr.commit();
    }
    
    public Article getDocumentById(long id) throws SolrServerException, IOException
    {
        SolrDocument document = clientSolr.getById(Long.toString(id));
        return new Article(
                id,
                document.getFieldValue("sourse").toString(),
                document.getFieldValue("text").toString(),
                document.getFieldValue("title").toString(),
                document.getFieldValue("response").toString()
        );
    }
    
    private long getNumberOfDocuments() throws SolrServerException, IOException
    {
        SolrQuery query = new SolrQuery();
        query.setQuery( "*" );
        
        QueryResponse response = clientSolr.query(query);
        
        SolrDocumentList listOfDocuments = response.getResults();
        return listOfDocuments.getNumFound();
    }
    
    public ArrayList<Article> getDocuments() throws SolrServerException, IOException
    {
        ArrayList<Article> listOfDocuments = new ArrayList<>();
        long numberOfDocs = getNumberOfDocuments();
        for (long documentId = 1; documentId <= numberOfDocs; ++documentId)
        {
            listOfDocuments.add(getDocumentById(documentId));
        }
        return listOfDocuments;
    }
        
    private SolrInputDocument createDocument(
            Article article
    ) throws IOException
    {
        SolrInputDocument newDocument = new SolrInputDocument();
        
        article.response = gson.toJson(new Parser().generateResponse(article));
        newDocument.addField("id", article.id);
        newDocument.addField("title", article.title);
        newDocument.addField("sourse", article.sourse);
        newDocument.addField("text", article.text);
        newDocument.addField("response", article.response);
        
        return newDocument;
    }
}
