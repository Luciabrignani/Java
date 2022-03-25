/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.tss.blogapp.control;


import java.util.List;
import java.util.Optional;
import javax.enterprise.context.RequestScoped;
import it.tss.blogapp.entity.Tag; 
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

/**
 *
 * @author tss
 */
@RequestScoped
@Transactional(Transactional.TxType.REQUIRED)
public class TagStore {

    @PersistenceContext
    EntityManager em;
    
    public List<Tag> all() {
        return em.createQuery("select e from Tag e")
                .getResultList();
    }

    public Optional<Tag> find(Long id) {
        Tag found = em.find(Tag.class, id);
        return found == null ? Optional.empty() : Optional.of(found);
    }
    
    public Tag save(Tag entity){
        Tag saved = em.merge(entity);
        return saved;
    }

    public void delete(Long id) {
        em.remove(em.getReference(Tag.class, id));
    }
    
    public Tag update(Tag entity){
        Tag update = em.merge(entity);
        return update;
    }
}
