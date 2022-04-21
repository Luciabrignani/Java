/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.tss.world.entity;

import it.tss.world.adapters.CountryTypeAdapter;
import java.io.Serializable;
import java.util.Objects;
import javax.json.bind.annotation.JsonbTypeAdapter;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author tss
 */
@Entity
@Table(name = "city")
public class City implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer ID;

    @Column(nullable = true, length = 35, name= "Name")
    private String name;
    
    @JsonbTypeAdapter(CountryTypeAdapter.class)
    @ManyToOne(optional = false)
    @JoinColumn(name = "CountryCode")
    private Country country;
    
    @Column(nullable = true, length = 20, name= "District")
    private String district;
    
    @Column(nullable = true, name= "Population")
    private Integer population;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String Name) {
        this.name = Name;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String District) {
        this.district = District;
    }

    public Integer getPopulation() {
        return population;
    }

    public void setPopulation(Integer Population) {
        this.population = Population;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 37 * hash + Objects.hashCode(this.ID);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final City other = (City) obj;
        return Objects.equals(this.ID, other.ID);
    }

    @Override
    public String toString() {
        return "City{" + "ID=" + ID + ", Name=" + name + ", CountryCode=" + country + ", District=" + district + ", Population=" + population + '}';
    }

}
