/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.tss.blogapp.boundary;

import it.tss.blogapp.control.PostStore;
import it.tss.blogapp.control.CommentStore;
import it.tss.blogapp.entity.Post;
import java.util.List;
import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.NotFoundException;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import it.tss.blogapp.entity.Comment;

/**
 *
 * @author tss
 */
@Path("/post")
public class PostResource {

    @Inject
    private PostStore post;
    
    @Inject
    private CommentStore comment;
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Post> all() {
        return post.all();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public void create(@Valid Post entity) {
        post.save(entity);
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Post find(@PathParam("id") Long id) {
        return post.find(id).orElseThrow(() -> new NotFoundException("Post non trovato. id=" + id));
    }

    @DELETE
    @Path("{id}")
    public void delete(@PathParam("id") Long id) {
        Post found = post.find(id).orElseThrow(() -> new NotFoundException("Post non trovato. id=" + id));
        post.delete(found.getId());
    }

    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public void update(@Valid Post entity) {
        post.update(entity);
    }

    @GET
    @Path("{id}/comments")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Comment> comment (@PathParam("id") Long id){
    return comment.byPost(id);   
    }
    
    @POST
    @Path("{id}/comments")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Post> createComments(@PathParam("id") Long id, @Valid Post entity) {
        return post.all();
    }
}
