{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}


{% block title %} {{ page.title }} | {{ config.title }} {% endblock %}

{% block page_class %}page-post-detail{% endblock %}


{% block content %}

  <div id="posts" class="posts-expand">
    {{ post_template.render(page) }}

    <div class="post-spread">
      {% if theme.jiathis %}
        {% include '_partials/share/jiathis.swig' %}
      {% elseif theme.baidushare %}
        {% include '_partials/share/baidushare.swig' %}
      {% elseif theme.add_this_id %}
        {% include '_partials/share/add-this.swig' %}
      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}
        {% include '_partials/share/duoshuo_share.swig' %}
      {% endif %}
    </div>
  </div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":["qzone","tsina","weixin","douban","sqq"],"bdPic":"","bdStyle":"2","bdSize":"16"},"slide":{"type":"slide","bdImg":"3","bdPos":"left","bdTop":"250"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}


{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}
