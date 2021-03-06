/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.model;

/**
 *
 * @author TASS
 */
public class CategoryModel extends AbstractModel<CategoryModel> {

    private Long id;
    private String name;
    private String code;
    private Integer percent;
    

    public CategoryModel() {
    }

    public CategoryModel(Long id, String name, String code) {
        this.id = id;
        this.name = name;
        this.code = code;
    }

    public Integer getPercent() {
        return percent;
    }

    public void setPercent(Integer percent) {
        this.percent = percent;
    }
    
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
