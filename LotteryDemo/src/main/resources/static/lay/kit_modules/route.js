/** kitadmin-v2.1.8 MIT License By http://kit.zhengjinfan.cn Author Van Zheng */
;"use strict";layui.define(["utils","jquery","lodash","nprogress","layer"],function(i){function e(){this.config={name:"KITADMINROUTE",routerViewId:void 0,beforeRender:void 0,routes:[]};var i=layui.router(location.hash);this.pathname=void 0===i.href?"/":i.href.split("?")[0],this.version="1.2.3"}var c=layui.utils,t=c.localStorage,o=t.setItem,n=t.getItem,v=layui.jquery,a=layui.lodash,f=layui.layer,h=v(window),p=void 0;e.prototype.set=function(i){return v.extend(!0,this.config,i),this},e.prototype.setRoutes=function(i){var e=this;i.name=i.name||e.config.name,e.config.name=i.name;var t={routes:[]};return v.extend(!0,t,i),a.forEach(t.routes,function(i){i.id=(new Date).getTime()+""+a.random(1e3,9999)}),o(t.name,t.routes),v(window).off("popstate").on("popstate",function(){c.isFunction(i.onChanged)?i.onChanged():e.render()}),e},e.prototype.getRoutes=function(){return n(this.config.name)},e.prototype.getRoute=function(i){var e=this.getRoutes(this.config.name);if(null!=e){i=i||location.hash;var t=layui.router(i);if(null!=t){var o=t.href.split("?"),n=c.find(e,function(i){return i.path===o[0]});return void 0===n||1<o.length&&(n.component+="?"+o[1],n.path+="?"+o[1]),n}}},e.prototype.render=function(i,e,t){var o=this,n=o.config,r=void 0;NProgress.start();var a=f.load(2),s=c.randomCode();if(e&&0<e.length)r=e;else{var l=void 0===n.routerViewId?v("router-view"):v("router-view#"+n.routerViewId);0<l.length&&(l.parent().append('<div id="'+s+'"></div>'),l.remove(),r=v("#"+s),p=r)}void 0===r&&(r=p);var u=o.getRoute(i);function d(){NProgress.done(),a&&f.close(a),c.isFunction(t)&&t()}return void 0!==u?("function"==typeof n.beforeRender&&(u=n.beforeRender(u)),u.iframe?(r.html('<iframe src="'+u.component+'" data-id="'+s+'" style="height: 780px;"></iframe>'),h.on("resize",function(){var i=v(".layui-body").height();v("iframe[data-id="+s+"]").height(i-3)}).resize(),d()):c.tplLoader(u.component,function(i){r.html(i),d(),c.setUrlState(u.name,"#"+u.path)},function(i){var e=['<div class="layui-fluid">','<div class="layui-row">','<div class="layui-col-xs12">','<div class="kit-not-router">',i,"</div>","</div>","</div>","</div>"].join("");r.html(e),d()})):(r.html(['<div class="layui-fluid">','  <div class="layui-row">','    <div class="layui-col-xs12">','      <div class="layui-row">','        <div class="layui-col-md4">&nbsp;</div>','        <div class="layui-col-md4">','          <div class="kit-exception">','            <i class="layui-icon kit-exception-icon">&#xe61c;</i>','            <h3 class="kit-exception-title">:>404 抱歉，你访问的页面不存在</h3>','            <a href="javascript:history.back(-1);" class="layui-btn">返回上一页</a>',"          </div>","        </div>",'        <div class="layui-col-md4">&nbsp;</div>',"      </div>","    </div>","  </div>","</div>"].join("")),NProgress.done(),a&&f.close(a)),o},e.prototype.params=function(){var i=layui.router();if(void 0===i.href)return null;var e=i.href,t=e.substr(e.indexOf("?")+1);if(e===t)return null;var o=t.split("&"),r={};return a.forEach(o,function(i,e){var t=i.split("="),o=t[0],n=t[1];r[o]=n}),r},i("route",new e)});
//# sourceMappingURL=route.js.map
