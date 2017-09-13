window.jQuery&&function(t){if(!t.support.opacity&&!t.support.style)try{document.execCommand("BackgroundImageCache",!1,!0)}catch(t){}t.fn.rating=function(a){if(0==this.length)return this;if("string"==typeof arguments[0]){if(this.length>1){var i=arguments;return this.each(function(){t.fn.rating.apply(t(this),i)})}return t.fn.rating[arguments[0]].apply(this,t.makeArray(arguments).slice(1)||[]),this}var a=t.extend({},t.fn.rating.options,a||{});return t.fn.rating.calls++,this.not(".star-rating-applied").addClass("star-rating-applied").each(function(){var i,r=t(this),n=(this.name||"unnamed-rating").replace(/\[|\]/g,"_").replace(/^\_+|\_+$/g,""),e=t(this.form||document.body),s=e.data("rating");s&&s.call==t.fn.rating.calls||(s={count:0,call:t.fn.rating.calls});var l=s[n]||e.data("rating"+n);l&&(i=l.data("rating")),l&&i?i.count++:(i=t.extend({},a||{},(t.metadata?r.metadata():t.meta?r.data():null)||{},{count:0,stars:[],inputs:[]}),i.serial=s.count++,l=t('<span class="star-rating-control"/>'),r.before(l),l.addClass("rating-to-be-drawn"),(r.attr("disabled")||r.hasClass("disabled"))&&(i.readOnly=!0),r.hasClass("required")&&(i.required=!0),l.append(i.cancel=t('<div class="rating-cancel"><a title="'+i.cancel+'">'+i.cancelValue+"</a></div>").on("mouseover",function(){t(this).rating("drain"),t(this).addClass("star-rating-hover")}).on("mouseout",function(){t(this).rating("draw"),t(this).removeClass("star-rating-hover")}).on("click",function(){t(this).rating("select")}).data("rating",i)));var d=t('<div role="text" aria-label="'+this.title+'" class="star-rating rater-'+i.serial+'"><a title="'+(this.title||this.value)+'">'+this.value+"</a></div>");if(l.append(d),this.id&&d.attr("id",this.id),this.className&&d.addClass(this.className),i.half&&(i.split=2),"number"==typeof i.split&&i.split>0){var c=(t.fn.width?d.width():0)||i.starWidth,h=i.count%i.split,u=Math.floor(c/i.split);d.width(u).find("a").css({"margin-left":"-"+h*u+"px"})}i.readOnly?d.addClass("star-rating-readonly"):d.addClass("star-rating-live").on("mouseover",function(){t(this).rating("fill"),t(this).rating("focus")}).on("mouseout",function(){t(this).rating("draw"),t(this).rating("blur")}).on("click",function(){t(this).rating("select")}),this.checked&&(i.current=d),"A"==this.nodeName&&t(this).hasClass("selected")&&(i.current=d),r.hide(),r.on("change.rating",function(a){return!a.selfTriggered&&void t(this).rating("select")}),d.data("rating.input",r.data("rating.star",d)),i.stars[i.stars.length]=d[0],i.inputs[i.inputs.length]=r[0],i.rater=s[n]=l,i.context=e,r.data("rating",i),l.data("rating",i),d.data("rating",i),e.data("rating",s),e.data("rating"+n,l)}),t(".rating-to-be-drawn").rating("draw").removeClass("rating-to-be-drawn"),this},t.extend(t.fn.rating,{calls:0,focus:function(){var a=this.data("rating");if(!a)return this;if(!a.focus)return this;var i=t(this).data("rating.input")||t("INPUT"==this.tagName?this:null);a.focus&&a.focus.apply(i[0],[i.val(),t("a",i.data("rating.star"))[0]])},blur:function(){var a=this.data("rating");if(!a)return this;if(!a.blur)return this;var i=t(this).data("rating.input")||t("INPUT"==this.tagName?this:null);a.blur&&a.blur.apply(i[0],[i.val(),t("a",i.data("rating.star"))[0]])},fill:function(){var t=this.data("rating");return t?void(t.readOnly||(this.rating("drain"),this.prevAll().addBack().filter(".rater-"+t.serial).addClass("star-rating-hover"))):this},drain:function(){var t=this.data("rating");return t?void(t.readOnly||t.rater.children().filter(".rater-"+t.serial).removeClass("star-rating-on").removeClass("star-rating-hover")):this},draw:function(){var a=this.data("rating");if(!a)return this;this.rating("drain");var i=t(a.current),r=i.length?i.prevAll().addBack().filter(".rater-"+a.serial):null;r&&r.addClass("star-rating-on"),a.cancel[a.readOnly||a.required?"hide":"show"](),this.siblings()[a.readOnly?"addClass":"removeClass"]("star-rating-readonly")},select:function(a,i){var r=this.data("rating");if(!r)return this;if(!r.readOnly){if(r.current=null,"undefined"!=typeof a||this.length>1){if("number"==typeof a)return t(r.stars[a]).rating("select",void 0,i);if("string"==typeof a)return t.each(r.stars,function(){t(this).data("rating.input").val()==a&&t(this).rating("select",void 0,i)}),this}else r.current="INPUT"==this[0].tagName?this.data("rating.star"):this.is(".rater-"+r.serial)?this:null;this.data("rating",r),this.rating("draw");var n=t(r.current?r.current.data("rating.input"):null),e=t(r.inputs).filter(":checked"),s=t(r.inputs).not(n);return s.prop("checked",!1),n.prop("checked",!0),t(n.length?n:e).trigger({type:"change",selfTriggered:!0}),(i||void 0==i)&&r.callback&&r.callback.apply(n[0],[n.val(),t("a",r.current)[0]]),this}},readOnly:function(a,i){var r=this.data("rating");return r?(r.readOnly=!(!a&&void 0!=a),i?t(r.inputs).attr("disabled","disabled"):t(r.inputs).removeAttr("disabled"),this.data("rating",r),void this.rating("draw")):this},disable:function(){this.rating("readOnly",!0,!0)},enable:function(){this.rating("readOnly",!1,!1)}}),t.fn.rating.options={cancel:"Cancel Rating",cancelValue:"",split:0,starWidth:16},t(function(){t("input[type=radio].star").rating()})}(jQuery),function(t){t(document).ready(function(){t(".q_stars").find("input[type=radio]").rating()})}(jQuery);