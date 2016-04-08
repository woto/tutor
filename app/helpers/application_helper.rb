module ApplicationHelper

  def container(options={})
    options[:class] = ['container', options[:class] ].compact
    content_tag :div, options do
      yield
    end
  end

  def row(options={})
    options[:class] = ['row', options[:class] ].compact
    content_tag :div, options do
      yield
    end
  end

  def auth_cols
    content_tag :div, class: 'col-md-16 offset-md-4 col-lg-14 offset-lg-5 col-xl-12 offset-xl-6' do
      yield
    end
  end

  def page_content
    content_tag :div, class: 'b-page-content' do
      yield
    end
  end

  def meta_title(options={})
    container do
      row do
        content_tag :div, class: 'col-xs-24' do
          options[:class] = ['b-page-header', options[:class]].compact
          content_tag :h1, options do 
            @meta_title
          end
        end
      end
    end
  end

  def user_name_helper
    tmp = [current_user.first_name, current_user.last_name].join(' ')
    tmp if tmp.present?
  end

  def icon(icon, css_class='')
    content_tag :i, '', class: ["fa", "fa-#{icon}", css_class].join(' ')
  end

  def discipline_grade_stars(grade)
    div, mod = grade.divmod(20)
    stars = 0
    capture do
      div.times do |n|
        stars += 1
        concat(icon 'star')
      end

      if mod.round >= 10
        stars += 1
        concat (icon 'star-half-o')
      end

      (5-stars).times.each do
        concat (icon 'star-o')
      end

      #concat grade
    end
  end

end
