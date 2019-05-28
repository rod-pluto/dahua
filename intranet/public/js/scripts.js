"use strict";

$(function () {

  // Collapse Navbar
  var navbarCollapse = function navbarCollapse() {
    if ($("#mainNav").offset().top > 100) {
      $("#mainNav").addClass("navbar-shrink");
    } else {
      $("#mainNav").removeClass("navbar-shrink");
    }
  };
  // Collapse now if page is not at top
  navbarCollapse();
  // Collapse the navbar when page is scrolled
  $(window).scroll(navbarCollapse);

  $("#mainNav").click(function () {
    $("#mainNav").toggleClass('expanded');
  });

  function instagram() {
    // GERADO ASSIM: https://www.instagram.com/oauth/authorize/?client_id=77876675b95143da9a0978055d67d2e4&redirect_uri=https://www.fyi-intercambios.com.br/&response_type=token
    var token = '267594983.7787667.80f8bd36d2204c8a8c8c8cef2a37b7ac';
    var username = 'expovalelajeado';
    var num_photos = 7;
    var x;

    $.ajax({

      url: 'https://api.instagram.com/v1/users/self/?access_token=' + token,
      dataType: 'jsonp',
      type: 'GET',
      data: { access_token: token, q: username },
      success: function success(data) {

        $.ajax({
          url: 'https://api.instagram.com/v1/users/self/media/recent/?access_token=' + token, // specify the ID of the first found user
          dataType: 'jsonp',
          type: 'GET',
          data: { access_token: token, count: num_photos },
          success: function success(data2) {

            console.log(data2.data);

            for (x in data2.data) {

              var html = '';
              html += '<div class="swiper-slide">';
              html += '      <a href="' + data2.data[x].link + '" target="blank" style="background-image:url(' + data2.data[x].images.standard_resolution.url + ');"></a>';
              html += '</div>';

              $('#instagram .swiper-wrapper').append(html);
            }

            startSwiperInsta();
          },
          error: function error(data2) {}
        });
      },
      error: function error(data) {}
    });
  }

  instagram();

  var width = $(window).width();

  function offset_left() {
    var offset = 0;

    if (width <= 991) {
      offset = $('#mainNav .container .navbar-brand .logo').offset().left;
    }

    console.log('retornou: ' + offset);
    console.log('retornou: ' + offset);
    return offset;
  }

  /* Instagram Swiper */
  var swiper_insta = null;
  var swiper_insta_options = {
    autoHeight: true,
    spaceBetween: 22,
    slidesPerView: 7,
    slidesOffsetBefore: offset_left(),
    breakpoints: {
      /*576: {
        slidesPerView: 1.2,
           },
      768: {
        slidesPerView: 1.5,
      },
      992: {
        slidesPerView: 3.2,
      },*/
      1200: {
        slidesPerView: 'auto'
      }
    }
  };

  function startSwiperInsta() {
    swiper_insta = new Swiper('#instagram .swiper-container', swiper_insta_options);
  }

  /* Home Slider */
  var swiper = new Swiper('header .swiper-container', {
    loop: true,
    navigation: {
      nextEl: '.slide-home .navigation .next',
      prevEl: '.slide-home .navigation .prev'
    }
    /*on: {
      slideChange: function () {
        console.log($(this).activeIndex);
      },
    }*/
  });

  swiper.on('slideChange', function () {
    $('.slide_index .number.current').text(("0" + (swiper.realIndex + 1)).slice(-2));
  });

  /* Cursos Swiper */
  var swiper_cursos = null;
  var swiper_cursos_options = {
    spaceBetween: 40,
    slidesPerView: 4,
    slidesOffsetBefore: offset_left(),
    breakpoints: {
      767: {
        slidesPerView: 1.2
      },
      991: {
        slidesPerView: 2
      }
    }
  };

  function startSwiperCursos() {
    swiper_cursos = new Swiper('#cursos .swiper-container', swiper_cursos_options);
  }

  startSwiperCursos();

  /* Videos Swiper */
  var swiper_videos = null;
  var swiper_videos_options = {
    spaceBetween: 40,
    slidesPerView: 3,
    slidesOffsetBefore: offset_left(),
    breakpoints: {
      767: {
        slidesPerView: 1.2
      },
      991: {
        slidesPerView: 2
      }
    },
    loop: true,
    navigation: {
      nextEl: '#tv .navigation .next',
      prevEl: '#tv .navigation .prev'
    }
  };

  function startSwiperVideos() {
    swiper_videos = new Swiper('#tv .swiper-container', swiper_videos_options);
    console.log('iniciou');
  }

  startSwiperVideos();

  /* Cursos Universidades */
  var swiper_universidades = null;
  var swiper_universidades_options = {
    slidesPerView: 1,
    loop: true,
    navigation: {
      nextEl: '#quem-somos .navigation .next',
      prevEl: '#quem-somos .navigation .prev'
    }
  };

  function startSwiperUniversidades() {
    swiper_universidades = new Swiper('#quem-somos .swiper-container', swiper_universidades_options);
  }

  startSwiperUniversidades();

  $(window).resize(function () {
    width = $(window).width();
    swiper_insta.params.slidesOffsetBefore = offset_left();
    swiper_cursos.params.slidesOffsetBefore = offset_left();
    swiper_videos.params.slidesOffsetBefore = offset_left();
  });

  $('#idioma').change(function (e) {

    updateIdiomas($(this).val());
  });

  function updateIdiomas(value) {
    console.log('-');
    //if(value == "") {
    var value = value;

    $(".paises .pais a").each(function (k, v) {
      if ($(this).data('idiomas').search(value) < 0) {
        $(this).parent().fadeOut();
      } else {
        $(this).parent().fadeIn();
      }
    });

    $(".paises .pais").each(function (k, v) {
      if ($(this).data('idiomas').search(value) < 0) {
        $(this).find("ul li a").each(function (k2, v2) {
          if ($(this).data('idiomas').search(value) < 0) {
            $(this).fadeOut();
          } else {
            $(this).fadeIn();
          }
        });
      }
    });
  }
});
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInNjcmlwdHMuanMiXSwibmFtZXMiOlsiJCIsIm5hdmJhckNvbGxhcHNlIiwib2Zmc2V0IiwidG9wIiwiYWRkQ2xhc3MiLCJyZW1vdmVDbGFzcyIsIndpbmRvdyIsInNjcm9sbCIsImNsaWNrIiwidG9nZ2xlQ2xhc3MiLCJpbnN0YWdyYW0iLCJ0b2tlbiIsInVzZXJuYW1lIiwibnVtX3Bob3RvcyIsIngiLCJhamF4IiwidXJsIiwiZGF0YVR5cGUiLCJ0eXBlIiwiZGF0YSIsImFjY2Vzc190b2tlbiIsInEiLCJzdWNjZXNzIiwiY291bnQiLCJkYXRhMiIsImNvbnNvbGUiLCJsb2ciLCJodG1sIiwibGluayIsImltYWdlcyIsInN0YW5kYXJkX3Jlc29sdXRpb24iLCJhcHBlbmQiLCJzdGFydFN3aXBlckluc3RhIiwiZXJyb3IiLCJ3aWR0aCIsIm9mZnNldF9sZWZ0IiwibGVmdCIsInN3aXBlcl9pbnN0YSIsInN3aXBlcl9pbnN0YV9vcHRpb25zIiwiYXV0b0hlaWdodCIsInNwYWNlQmV0d2VlbiIsInNsaWRlc1BlclZpZXciLCJzbGlkZXNPZmZzZXRCZWZvcmUiLCJicmVha3BvaW50cyIsIlN3aXBlciIsInN3aXBlciIsImxvb3AiLCJuYXZpZ2F0aW9uIiwibmV4dEVsIiwicHJldkVsIiwib24iLCJ0ZXh0IiwicmVhbEluZGV4Iiwic2xpY2UiLCJzd2lwZXJfY3Vyc29zIiwic3dpcGVyX2N1cnNvc19vcHRpb25zIiwic3RhcnRTd2lwZXJDdXJzb3MiLCJzd2lwZXJfdmlkZW9zIiwic3dpcGVyX3ZpZGVvc19vcHRpb25zIiwic3RhcnRTd2lwZXJWaWRlb3MiLCJzd2lwZXJfdW5pdmVyc2lkYWRlcyIsInN3aXBlcl91bml2ZXJzaWRhZGVzX29wdGlvbnMiLCJzdGFydFN3aXBlclVuaXZlcnNpZGFkZXMiLCJyZXNpemUiLCJwYXJhbXMiLCJjaGFuZ2UiLCJlIiwidXBkYXRlSWRpb21hcyIsInZhbCIsInZhbHVlIiwiZWFjaCIsImsiLCJ2Iiwic2VhcmNoIiwicGFy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QUFpQjtBQUN6QyxVQUFHeEUsRUFBRSxJQUFGLEVBQVFtQixJQUFSLENBQWEsU0FBYixFQUF3QnNELE1BQXhCLENBQStCSixLQUEvQixJQUF3QyxDQUEzQyxFQUE4QztBQUM1Q3JFLFVBQUUsSUFBRixFQUFRMEUsTUFBUixHQUFpQkMsT0FBakI7QUFDRCxPQUZELE1BRUs7QUFDSDNFLFVBQUUsSUFBRixFQUFRMEUsTUFBUixHQUFpQkUsTUFBakI7QUFDRDtBQUNGLEtBTkQ7O0FBU0E1RSxNQUFFLGVBQUYsRUFBbUJzRSxJQUFuQixDQUF3QixVQUFVQyxDQUFWLEVBQWFDLENBQWIsRUFBaUI7QUFDdkMsVUFBR3hFLEVBQUUsSUFBRixFQUFRbUIsSUFBUixDQUFhLFNBQWIsRUFBd0JzRCxNQUF4QixDQUErQkosS0FBL0IsSUFBd0MsQ0FBM0MsRUFBOEM7QUFDNUNyRSxVQUFFLElBQUYsRUFBUTZFLElBQVIsQ0FBYSxTQUFiLEVBQXdCUCxJQUF4QixDQUE2QixVQUFVUSxFQUFWLEVBQWNDLEVBQWQsRUFBbUI7QUFDOUMsY0FBRy9FLEVBQUUsSUFBRixFQUFRbUIsSUFBUixDQUFhLFNBQWIsRUFBd0JzRCxNQUF4QixDQUErQkosS0FBL0IsSUFBd0MsQ0FBM0MsRUFBOEM7QUFDNUNyRSxjQUFFLElBQUYsRUFBUTJFLE9BQVI7QUFDRCxXQUZELE1BRUs7QUFDSDNFLGNBQUUsSUFBRixFQUFRNEUsTUFBUjtBQUNEO0FBQ0YsU0FORDtBQU9EO0FBQ0YsS0FWRDtBQVdIO0FBR0YsQ0F2UEQiLCJmaWxlIjoic2NyaXB0cy5qcyIsInNvdXJjZXNDb250ZW50IjpbIiQoZnVuY3Rpb24oKXtcblxuICAvLyBDb2xsYXBzZSBOYXZiYXJcbiAgdmFyIG5hdmJhckNvbGxhcHNlID0gZnVuY3Rpb24oKSB7XG4gICAgaWYgKCQoXCIjbWFpbk5hdlwiKS5vZmZzZXQoKS50b3AgPiAxMDApIHtcbiAgICAgICQoXCIjbWFpbk5hdlwiKS5hZGRDbGFzcyhcIm5hdmJhci1zaHJpbmtcIik7XG4gICAgfSBlbHNlIHtcbiAgICAgICQoXCIjbWFpbk5hdlwiKS5yZW1vdmVDbGFzcyhcIm5hdmJhci1zaHJpbmtcIik7XG4gICAgfVxuICB9O1xuICAvLyBDb2xsYXBzZSBub3cgaWYgcGFnZSBpcyBub3QgYXQgdG9wXG4gIG5hdmJhckNvbGxhcHNlKCk7XG4gIC8vIENvbGxhcHNlIHRoZSBuYXZiYXIgd2hlbiBwYWdlIGlzIHNjcm9sbGVkXG4gICQod2luZG93KS5zY3JvbGwobmF2YmFyQ29sbGFwc2UpO1xuXG4gICQoXCIjbWFpbk5hdlwiKS5jbGljayhmdW5jdGlvbigpe1xuICAgICQoXCIjbWFpbk5hdlwiKS50b2dnbGVDbGFzcygnZXhwYW5kZWQnKTtcbiAgfSk7XG5cblxuICBmdW5jdGlvbiBpbnN0YWdyYW0oKSB7XG4gICAgLy8gR0VSQURPIEFTU0lNOiBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL29hdXRoL2F1dGhvcml6ZS8/Y2xpZW50X2lkPTc3ODc2Njc1Yjk1MTQzZGE5YTA5NzgwNTVkNjdkMmU0JnJlZGlyZWN0X3VyaT1odHRwczovL3d3dy5meWktaW50ZXJjYW1iaW9zLmNvbS5ici8mcmVzcG9uc2VfdHlwZT10b2tlblxuICAgIHZhciB0b2tlbiA9ICcyNjc1OTQ5ODMuNzc4NzY2Ny44MGY4YmQzNmQyMjA0YzhhOGM4YzhjZWYyYTM3YjdhYyc7XG4gICAgdmFyIHVzZXJuYW1lID0gJ2V4cG92YWxlbGFqZWFkbyc7XG4gICAgdmFyIG51bV9waG90b3MgPSA3O1xuICAgIHZhciB4O1xuXG4gICAgJC5hamF4KHtcblxuICAgICAgdXJsOiAnaHR0cHM6Ly9hcGkuaW5zdGFncmFtLmNvbS92MS91c2Vycy9zZWxmLz9hY2Nlc3NfdG9rZW49Jyt0b2tlbixcbiAgICAgIGRhdGFUeXBlOiAnanNvbnAnLFxuICAgICAgdHlwZTogJ0dFVCcsXG4gICAgICBkYXRhOiB7YWNjZXNzX3Rva2VuOiB0b2tlbiwgcTogdXNlcm5hbWV9LFxuICAgICAgc3VjY2VzczogZnVuY3Rpb24oZGF0YSl7XG5cbiAgICAgICAkLmFqYXgoe1xuICAgICAgICAgIHVybDogJ2h0dHBzOi8vYXBpLmluc3RhZ3JhbS5jb20vdjEvdXNlcnMvc2VsZi9tZWRpYS9yZWNlbnQvP2FjY2Vzc190b2tlbj0nICsgdG9rZW4sIC8vIHNwZWNpZnkgdGhlIElEIG9mIHRoZSBmaXJzdCBmb3VuZCB1c2VyXG4gICAgICAgICAgZGF0YVR5cGU6ICdqc29ucCcsXG4gICAgICAgICAgdHlwZTogJ0dFVCcsXG4gICAgICAgICAgZGF0YToge2FjY2Vzc190b2tlbjogdG9rZW4sIGNvdW50OiBudW1fcGhvdG9zfSxcbiAgICAgICAgICBzdWNjZXNzOiBmdW5jdGlvbihkYXRhMil7XG5cbiAgICAgICAgICAgIGNvbnNvbGUubG9nKGRhdGEyLmRhdGEpO1xuICAgICAgICAgICAgXG5cbiAgICAgICAgICAgIGZvcih4IGluIGRhdGEyLmRhdGEpe1xuXG4gICAgICAgICAgICAgIHZhciBodG1sID0gJyc7XG4gICAgICAgICAgICAgIGh0bWwgKz0gJzxkaXYgY2xhc3M9XCJzd2lwZXItc2xpZGVcIj4nO1xuICAgICAgICAgICAgICBodG1sICs9ICcgICAgICA8YSBocmVmPVwiJyArIGRhdGEyLmRhdGFbeF0ubGluayArICdcIiB0YXJnZXQ9XCJibGFua1wiIHN0eWxlPVwiYmFja2dyb3VuZC1pbWFnZTp1cmwoJyArIGRhdGEyLmRhdGFbeF0uaW1hZ2VzLnN0YW5kYXJkX3Jlc29sdXRpb24udXJsICsgJyk7XCI+PC9hPidcbiAgICAgICAgICAgICAgaHRtbCArPSAnPC9kaXY+JztcblxuICAgICAgICAgICAgICAkKCcjaW5zdGFncmFtIC5zd2lwZXItd3JhcHBlcicpLmFwcGVuZChodG1sKTsgICAgICBcbiAgICAgICAgICAgIH1cblxuICAgICAgICAgICAgc3RhcnRTd2lwZXJJbnN0YSgpO1xuXG4gICAgICAgICAgfSxcbiAgICAgICAgICBlcnJvcjogZnVuY3Rpb24oZGF0YTIpe1xuICAgICAgICAgIH1cbiAgICAgICAgfSk7XG4gICAgICB9LFxuICAgICAgZXJyb3I6IGZ1bmN0aW9uKGRhdGEpe1xuICAgICAgfVxuICAgIH0pO1xuICB9XG5cbiAgaW5zdGFncmFtKCk7XG5cblxuICB2YXIgd2lkdGggPSAkKHdpbmRvdykud2lkdGgoKTtcblxuXG4gIGZ1bmN0aW9uIG9mZnNldF9sZWZ0KCl7XG4gICAgdmFyIG9mZnNldCA9IDA7XG5cbiAgICBpZih3aWR0aCA8PSA5OTEpe1xuICAgICAgb2Zmc2V0ID0gJCgnI21haW5OYXYgLmNvbnRhaW5lciAubmF2YmFyLWJyYW5kIC5sb2dvJykub2Zmc2V0KCkubGVmdDtcbiAgICB9XG5cbiAgICBjb25zb2xlLmxvZygncmV0b3Jub3U6ICcrb2Zmc2V0KTtcbiAgICBjb25zb2xlLmxvZygncmV0b3Jub3U6ICcrb2Zmc2V0KTtcbiAgICByZXR1cm4gb2Zmc2V0O1xuICB9XG5cbiAgLyogSW5zdGFncmFtIFN3aXBlciAqL1xuICB2YXIgc3dpcGVyX2luc3RhID0gbnVsbDtcbiAgdmFyIHN3aXBlcl9pbnN0YV9vcHRpb25zID0ge1xuICAgIGF1dG9IZWlnaHQ6IHRydWUsXG4gICAgc3BhY2VCZXR3ZWVuOiAyMixcbiAgICBzbGlkZXNQZXJWaWV3OiA3LFxuICAgIHNsaWRlc09mZnNldEJlZm9yZTogb2Zmc2V0X2xlZnQoKSxcbiAgICBicmVha3BvaW50czoge1xuICAgICAgLyo1NzY6IHtcbiAgICAgICAgc2xpZGVzUGVyVmlldzogMS4yLFxuICAgIFxuICAgICAgfSxcbiAgICAgIDc2ODoge1xuICAgICAgICBzbGlkZXNQZXJWaWV3OiAxLjUsXG4gICAgICB9LFxuICAgICAgOTkyOiB7XG4gICAgICAgIHNsaWRlc1BlclZpZXc6IDMuMixcbiAgICAgIH0sKi9cbiAgICAgIDEyMDA6IHtcbiAgICAgICAgc2xpZGVzUGVyVmlldzogJ2F1dG8nLFxuICAgICAgfVxuICAgIH1cbiAgfTtcblxuICBmdW5jdGlvbiBzdGFydFN3aXBlckluc3RhKCkge1xuICAgIHN3aXBlcl9pbnN0YSA9IG5ldyBTd2lwZXIoJyNpbnN0YWdyYW0gLnN3aXBlci1jb250YWluZXInLCBzd2lwZXJfaW5zdGFfb3B0aW9ucyk7XG4gIH1cblxuICBcbiAgLyogSG9tZSBTbGlkZXIgKi9cbiAgdmFyIHN3aXBlciA9IG5ldyBTd2lwZXIoJ2hlYWRlciAuc3dpcGVyLWNvbnRhaW5lcicsIHtcbiAgICBsb29wOiB0cnVlLFxuICAgIG5hdmlnYXRpb246IHtcbiAgICAgIG5leHRFbDogJy5zbGlkZS1ob21lIC5uYXZpZ2F0aW9uIC5uZXh0JyxcbiAgICAgIHByZXZFbDogJy5zbGlkZS1ob21lIC5uYXZpZ2F0aW9uIC5wcmV2JyxcbiAgICB9LFxuICAgIC8qb246IHtcbiAgICAgIHNsaWRlQ2hhbmdlOiBmdW5jdGlvbiAoKSB7XG4gICAgICAgIGNvbnNvbGUubG9nKCQodGhpcykuYWN0aXZlSW5kZXgpO1xuICAgICAgfSxcbiAgICB9Ki9cbiAgfSk7XG5cbiAgc3dpcGVyLm9uKCdzbGlkZUNoYW5nZScsIGZ1bmN0aW9uICgpIHtcbiAgICAkKCcuc2xpZGVfaW5kZXggLm51bWJlci5jdXJyZW50JykudGV4dCgoXCIwXCIrKHN3aXBlci5yZWFsSW5kZXgrMSkpLnNsaWNlKC0yKSk7XG4gIH0pXG5cbiAgLyogQ3Vyc29zIFN3aXBlciAqL1xuICB2YXIgc3dpcGVyX2N1cnNvcyA9IG51bGw7XG4gIHZhciBzd2lwZXJfY3Vyc29zX29wdGlvbnMgPSB7XG4gICAgc3BhY2VCZXR3ZWVuOiA0MCxcbiAgICBzbGlkZXNQZXJWaWV3OiA0LFxuICAgIHNsaWRlc09mZnNldEJlZm9yZTogb2Zmc2V0X2xlZnQoKSxcbiAgICBicmVha3BvaW50czoge1xuICAgICAgNzY3OiB7XG4gICAgICAgIHNsaWRlc1BlclZpZXc6IDEuMixcbiAgICAgIH0sXG4gICAgICA5OTE6IHtcbiAgICAgICAgc2xpZGVzUGVyVmlldzogMixcbiAgICAgIH1cbiAgICB9XG4gIH07XG5cbiAgZnVuY3Rpb24gc3RhcnRTd2lwZXJDdXJzb3MoKSB7XG4gICAgc3dpcGVyX2N1cnNvcyA9IG5ldyBTd2lwZXIoJyNjdXJzb3MgLnN3aXBlci1jb250YWluZXInLCBzd2lwZXJfY3Vyc29zX29wdGlvbnMpO1xuICB9XG5cbiAgc3RhcnRTd2lwZXJDdXJzb3MoKTtcblxuXG4gIC8qIFZpZGVvcyBTd2lwZXIgKi9cbiAgdmFyIHN3aXBlcl92aWRlb3MgPSBudWxsO1xuICB2YXIgc3dpcGVyX3ZpZGVvc19vcHRpb25zID0ge1xuICAgIHNwYWNlQmV0d2VlbjogNDAsXG4gICAgc2xpZGVzUGVyVmlldzogMyxcbiAgICBzbGlkZXNPZmZzZXRCZWZvcmU6IG9mZnNldF9sZWZ0KCksXG4gICAgYnJlYWtwb2ludHM6IHtcbiAgICAgIDc2Nzoge1xuICAgICAgICBzbGlkZXNQZXJWaWV3OiAxLjIsXG4gICAgICB9LFxuICAgICAgOTkxOiB7XG4gICAgICAgIHNsaWRlc1BlclZpZXc6IDIsXG4gICAgICB9XG4gICAgfSxcbiAgICBsb29wOiB0cnVlLFxuICAgIG5hdmlnYXRpb246IHtcbiAgICAgIG5leHRFbDogJyN0diAubmF2aWdhdGlvbiAubmV4dCcsXG4gICAgICBwcmV2RWw6ICcjdHYgLm5hdmlnYXRpb24gLnByZXYnLFxuICAgIH0sXG4gIH07XG5cblxuXG4gIGZ1bmN0aW9uIHN0YXJ0U3dpcGVyVmlkZW9zKCkge1xuICAgIHN3aXBlcl92aWRlb3MgPSBuZXcgU3dpcGVyKCcjdHYgLnN3aXBlci1jb250YWluZXInLCBzd2lwZXJfdmlkZW9zX29wdGlvbnMpO1xuICAgIGNvbnNvbGUubG9nKCdpbmljaW91Jyk7XG4gIH1cblxuICBzdGFydFN3aXBlclZpZGVvcygpO1xuXG5cblxuICAvKiBDdXJzb3MgVW5pdmVyc2lkYWRlcyAqL1xuICB2YXIgc3dpcGVyX3VuaXZlcnNpZGFkZXMgPSBudWxsO1xuICB2YXIgc3dpcGVyX3VuaXZlcnNpZGFkZXNfb3B0aW9ucyA9IHtcbiAgICBzbGlkZXNQZXJWaWV3OiAxLFxuICAgIGxvb3A6IHRydWUsXG4gICAgbmF2aWdhdGlvbjoge1xuICAgICAgbmV4dEVsOiAnI3F1ZW0tc29tb3MgLm5hdmlnYXRpb24gLm5leHQnLFxuICAgICAgcHJldkVsOiAnI3F1ZW0tc29tb3MgLm5hdmlnYXRpb24gLnByZXYnLFxuICAgIH0sXG4gIH07XG5cbiAgZnVuY3Rpb24gc3RhcnRTd2lwZXJVbml2ZXJzaWRhZGVzKCkge1xuICAgIHN3aXBlcl91bml2ZXJzaWRhZGVzID0gbmV3IFN3aXBlcignI3F1ZW0tc29tb3MgLnN3aXBlci1jb250YWluZXInLCBzd2lwZXJfdW5pdmVyc2lkYWRlc19vcHRpb25zKTtcbiAgfVxuXG4gIHN0YXJ0U3dpcGVyVW5pdmVyc2lkYWRlcygpO1xuXG5cblxuICAkKHdpbmRvdykucmVzaXplKGZ1bmN0aW9uKCl7XG4gICAgd2lkdGggPSAkKHdpbmRvdykud2lkdGgoKTtcbiAgICBzd2lwZXJfaW5zdGEucGFyYW1zLnNsaWRlc09mZnNldEJlZm9yZSA9IG9mZnNldF9sZWZ0KCk7XG4gICAgc3dpcGVyX2N1cnNvcy5wYXJhbXMuc2xpZGVzT2Zmc2V0QmVmb3JlID0gb2Zmc2V0X2xlZnQoKTtcbiAgICBzd2lwZXJfdmlkZW9zLnBhcmFtcy5zbGlkZXNPZmZzZXRCZWZvcmUgPSBvZmZzZXRfbGVmdCgpO1xuICB9KTtcblxuXG4gICQoJyNpZGlvbWEnKS5jaGFuZ2UoZnVuY3Rpb24oZSl7XG4gICAgXG4gICAgICB1cGRhdGVJZGlvbWFzKCQodGhpcykudmFsKCkpO1xuICB9KTtcblxuICBmdW5jdGlvbiB1cGRhdGVJZGlvbWFzKHZhbHVlKSB7XG4gICAgY29uc29sZS5sb2coJy0nKTtcbiAgICAvL2lmKHZhbHVlID09IFwiXCIpIHtcbiAgICAgIHZhciB2YWx1ZSA9IHZhbHVlO1xuXG4gICAgICAkKFwiLnBhaXNlcyAucGFpcyBhXCIpLmVhY2goZnVuY3Rpb24oIGssIHYgKSB7XG4gICAgICAgIGlmKCQodGhpcykuZGF0YSgnaWRpb21hcycpLnNlYXJjaCh2YWx1ZSkgPCAwKSB7XG4gICAgICAgICAgJCh0aGlzKS5wYXJlbnQoKS5mYWRlT3V0KCk7XG4gICAgICAgIH1lbHNle1xuICAgICAgICAgICQodGhpcykucGFyZW50KCkuZmFkZUluKCk7XG4gICAgICAgIH1cbiAgICAgIH0pO1xuXG5cbiAgICAgICQoXCIucGFpc2VzIC5wYWlzXCIpLmVhY2goZnVuY3Rpb24oIGssIHYgKSB7XG4gICAgICAgIGlmKCQodGhpcykuZGF0YSgnaWRpb21hcycpLnNlYXJjaCh2YWx1ZSkgPCAwKSB7XG4gICAgICAgICAgJCh0aGlzKS5maW5kKFwidWwgbGkgYVwiKS5lYWNoKGZ1bmN0aW9uKCBrMiwgdjIgKSB7XG4gICAgICAgICAgICBpZigkKHRoaXMpLmRhdGEoJ2lkaW9tYXMnKS5zZWFyY2godmFsdWUpIDwgMCkge1xuICAgICAgICAgICAgICAkKHRoaXMpLmZhZGVPdXQoKTtcbiAgICAgICAgICAgIH1lbHNle1xuICAgICAgICAgICAgICAkKHRoaXMpLmZhZGVJbigpO1xuICAgICAgICAgICAgfVxuICAgICAgICAgIH0pO1xuICAgICAgICB9XG4gICAgICB9KTtcbiAgfVxuXG5cbn0pOyJdfQ==
