package controllers

import (
	"github.com/astaxie/beego"
)

type IndexController struct {
	beego.Controller
}

func (this *IndexController) Get() {
	this.Layout = "layout/layout.tpl"
	this.TplName = "index.tpl"
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["mainNav"] = "layout/main-nav.tpl"
}
