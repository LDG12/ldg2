    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page session="true"%>
    <c:set var="loginId" value="${sessionScope.id}"/>
    <c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
    <c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>

    <html>
    <head>
        <meta charset="UTF-8">
        <title>fastcampus</title>
        <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                color: #666; font-family: "맑은 고딕", 돋움,  "Apple SD Gothic Neo", tahoma; _font-family: 돋움, tahoma; font-size: 12px; letter-spacing: -0.5px;
            }
            body{
                background-color: #f8f8f8;
            }

            #option_Schedule{
                background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAZCAMAAABqz6zkAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAADAUExURf///8h5ba04Jsl8cP/+/rFEM7JFNP79/efGwP78/Pnw768+Lfnx8P37++bCvK46KbZMPMd2arJEM7JENMZ2abVLO+fEv7FALrFCMNunn606KLtbS9ypoerNyerMx+rNyOvPyvPh37RJOLRIOPPi37dRQbdSQv79/PLg3bNIN/Lg3urLx+nLxuvNyduon92ro7BALufEvrVNPcZ3a7NFNLNGNch4bLZNPejGwenJxLA/Lvrz8enIw8l6bq46KMp+csvZxXgAAAABYktHRACIBR1IAAAACXBIWXMAABJ0AAASdAHeZh94AAAAB3RJTUUH5wkJBg4cOYKhEgAAAMNJREFUKM/d0scOwjAMBuDgFtIFYY8GKJS9Z9nj/d+K1hJSheqWEwf+U6R8SmwnjP1hUgCgJCo17bOMGke4pjPD9JlpsazGKZYT+UIRgpTKFVEllFGDcOpWNGvgri0VaeOqGc1aqNqccQddh7i16wLIoHIuAXp9stPBe2QKwHBEsfEkdJo7JdQMa3P82uZY2yKaLT86XRFzW381N7YR290eiXc4ihPZ6VlnVvCmlyvTb+SbBsEf4sX+EMz98bCfieoXeQHiDQwEyKJ+RwAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMy0wOS0wOVQwNjoxNDoyNSswMDowME5B0AwAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjMtMDktMDlUMDY6MTQ6MjUrMDA6MDA/HGiwAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDIzLTA5LTA5VDA2OjE0OjI4KzAwOjAwCd4orwAAAABJRU5ErkJggg==");
                background-repeat: no-repeat; background-position: left; background-size: 50px 30px;
                width:90px;
                border: 1px solid #ccc;
                height:40px;
                background-color : #ffffff;
                padding-left: 20px;
            }
            #option_Schedule:hover{
                cursor:pointer;
            }
            #select_Semester{
                border: 0; width: 100%; height: 40px; line-height: 20px; padding: 10px; box-sizing: border-box; border: 2px solid #d6d6d6;
                color: #292929; font-size: 14px; background-color: transparent;
            }
            li.extension > a.create{
                background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAcIAAAGVCAIAAADi8WZdAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAAGYktHRAD/AP8A/6C9p5MAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAAAHdElNRQfnCQkFMShCrsHCAAAic0lEQVR42u3d7WLbttKu4ZkBSElO1z7/43xXbEskgdk/AJCUk3SlhVzT7n3VlRzbUkQ5ejT4pLq7AAD+LvvoBwAAnxsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgS/zoBwD8jPvdn372xd+iKiL6w1eAByJGcTAlK929fu7lYv2SbJc/o+2q/qdSgrTk6ZqhhCkehxjFkdTwdPHs2cXdPXvO4l4v3aV81FS9U5JStFyqqpVLNZV2Wb8lJCkehhjFsbi75Oz1I3lKnrOn5DmVL66R+iZJW4aqlkszMVMLGsplMAturmZqbUiAJMUjEKM4jFpp5pKbOSVPS14WT0teZk+pfuTkOUt291wb+FVJTxW1NTo1RIvBwqAxSowaQv03H0yFDMVjEKM4EBfx7J5zTsmXOS9znuc0T3ma8jL7UlPVU/actja+iJR+TzU11bAGaNQYbRhtSCGP4q4uVpr0ToriYYhRHIm7uHsudeicpinfbmm6ptstT7c8z3me8zK3JM3uucWoqqqY1vZ7jDYMNgw2jDaewimJZxE3FTf1bGKu7jTq8RDEKA7F3bOnlJclz3O+3ZbrS7q+Lq+v6XbN0y1NtzzdJWkdtS9domYWgtYMHcPpFE7ncJ5bX2rtM3UzdXOhHsVjEKM4EHepg0tpSfOUpmu6vs7Pz8vL9/T6ulzXMJ299JaWarQkopqGYCHYMNh4qhl6ucRlEXdVVTMNpiFqyO5OhuJRiFEcRZ0o6u4p5WXO05Rut+X6urx8X56/z8/fl9eX9Pqabtc03fI8+7K0MnMXozHaOIbxHC/ncHmKyyK5ZGjQEDVGi4PnQXadqkAnYhSH4us8p7zMebqlaylIW5K+vNSadJ58WTylMuupji/FYHEI4ymcz3l+ikuS7GpastXGky9jnThFhuJxiFEchtcFS3WiaOkenW7p+ppeX+bn7/Pzf5fn5+X1JV2vabqVGK3TnkqbPUYbhnA6x3kqCauqFmMaT2G65GXOafGUpQ5MkaR4DGIUh+LeYrSMMqXplq7X5fq6vL4sz8/z8/fl5Xl5fS0D929itFSdeZp87Q8NwcZTuNzyPNXu1Jza+ihRhpnwCMQojsS37tEy5ynPc5qmdL2m19fl9WV5eV6ev9eB+zcxGsxitPlUM7QUp+OYp2uepjzPealroqTO2y9/HzmKXsQoDsVro96zp+wp+TznecrzlKZbum2VaYvRxXMWKdVosBhDacu3yjTdzmkqs02XmqGZFj0ejBjFkZRwc5dcVoWWJaEpz0sueTqtH7c03cWoWZCcRETNUhzCPOd59mXeteWT5Lxb+kSS4jGIURxL2yGvdJK6eNuXpORpWsqS0Lwsviy5xqirarYsKmohL8nTktPS1uCXXU68LR6V0nfw0QeKr4MYxeHUzUTdW5qWXUhyaZKvl6W6lJxF3FVF1PMPP1PCuN0VAYr3QIzimFr/ZdukuW2MV76+Jm0NRxWV7Yfaz5erXfnJbFG8B87FhCPyN9drFVmH8mUNzbU/dS1ht5/3t3cn1KJ4B8QojkjvrrV9lB1I6ub12ybN5buqdZ+nsvu9aLtRvelHHxO+LBr1OKA1NOtJQWp4Wj0FiKiVTew1m6uollXzZc/m8lm9WON1C+GPPjZ8PcQoDmY7B522KxVVWSOyBKi1ve5bKapazhpiaiZqqvVS14q1VqZbgQo8BDGKA9sVkbpuzFwj1dRMsomJuEvJ0PJFXctSbdVr/cN23lDgcegbxTG1mlHXVvmuhS+7iFzPotx6Qre2vP54phACFI9HjOLz0F/FYEvYdj763Y/p2/Eq4NGIUXwGv5+A3nFb4G8hRvFJ/K80XKeVfvQDxb8OMYpP6/cDk2lOeE/EKD6L3ypHgX8eMQoAXYhRfBZUmzgoYhQAuhCj+CoYRsIHIUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQojskfemf+8LsEVsQo/oVcxElVPAoxin8nFf3oh4CvghjF0Wi71J99/df+pLpUvb+DX/0VwN9BjOJISo24pp7+8O2/foc/3FRFRetf9NHHiy+BGMVRqJZ4KxmqUrKufuVvBZ6uVafIele6z1HgAYhRHEiJOFF9G55/OfJ0f5drFquW///mnQI/RYziMFpLe1eW7upT+Yu598ONtDbj17KUGMVjEKM4FL1rietakv6N1FuHlXbF7dYnSobiYYhRHMlWj2pJvxZ/u5/4Cwm43VbXpv1W7JKkeAxiFIeyGwh6Wz/KrwPUd5e/uM/1HmnR49GIURzYn2Wd3+fm/16TtE2l+q0fB35X/OgHgB5fYkXjvjD07J7Fs7i7u7jI3eWfHu5PM9e3Z8ndxbNn9+zu2T2rhq/1TAp9vh+CGP083Nv1+op/8+L/LElwP4jurdmes6dUPnJKnrPn5LnGXis/1yL0TcP8vpVek9elBma5q+Rp/SR5SvVOvN2n72//Kejdp671ke/7fem+eH/E6GdwF6Auvn2yXpZP1xvc3/5YL6Q2FK+7wXQRF885L0v58JQ8LZ5SSVLJ2XOrT3dH5fVqnbK/Hml9ltxzzdCazosvS17mvCwagq2Pxrdb3b1PHcjPfqe6v1qH50Rcy1Oi5U2CJH1nxOjh+doiFXH3rcHr2ye7H/iNe9SPrbbuRspVRVp2pZSnKU9Tnuc8T3me8zL7kjwlz7WlL36fcaq1mN0lhW/PTMnf5Cnlkp7znObJpjnHSa1EjG39pe1ZlY+P0t/7Ha3Poe5WfNXZCCqqTpL+I4jRY9u/pHN299LIlZw9Z3GvlyU4xN9urHn32jnEC6nN2iyvc1vjwj37ktI8pds13a7pdkvTLU1TnidfllaZ7lv37c5qq/yuGHUp3aDZc/IWoHma0nSz283ioGbi7jGJ2bauyd1ze3/66Cdqx99c7w99F5qmpqrmZqomZmKqYiTpP4AY/SRyCYXWPl27+VIq7dZdiVqbpluD+e3ORh+lZl+ddqS2BV9p0aeU5yldX5eXl+X1JV2v+VaTtDbzc6qjT+1oVNVLQNyNU7mU/tC1CJ2mdLsu16sNo4VYYiWnpeTpXYy6S27vSR//jMl9p63vHtM6r9bUVNQ0BDVTC/WTENSDmKiRpO+OGD26Or7s2XPKqdZWviy1m6+Uaakkad7a+Hvbi+fjY3S3at7Eds3p7J6WPM/pdl1eX5aX5+XleXl9SbfXNN12Sbo/Rt0Gmu4W4Zcu0eRpy9B0fV3GUc1ExHPKyxxuJ41RLexjtBakd30HH/ikrXXoz4pj1fIeUKMzBItRQ7QYNQ7mLqE+/K0mxfsgRg9sba232srn2ruX510fYmnzlkHtnO9fcrttOD5+Pw7fFciqtgZf6Y3InlKelzRd07Uk6ff5+XstS6cpL1Np2kvO68GVVPbdNP36tK2l6DSl6Zaur8swqAVx95zyPIXr1cbRQmyNet094Vnuupk/NEbvx76276wN+WAWooZow2DDYMNowxiGLJ5N2poDow59X8To0dXh5pRzSnmZ03RLt9LavZU+xDxPpT6trf6SArv03C2HPIq7zUdKQmSv/ZhzKx5fX0tNmq6lIJ3zsnhO7mupqOt2I+VPom18KedS2+Z5StfrEqOGICK14L1ew3iyYSjt37cdAu5H6hp12fppWgO/DilZabxbjBbHMI52OofTKZySeBYRUTNVV6t9H5Sj74YYPbgysclrE3We83RL12u6vi7X1/T6kq7XNJVirU0PqsWU7CfBtBbdMV5H7YGtr2svzeg1+6Zbmm7pel2uL8vLy3J9TdO1jTWl2hHcDmsLvNaoL9VoTklLiz5cNZiolglVYZrCeLJxtBjVgphu8VID6zhT8XezL/aXImKqahqClTp0PIXTOc6zp6VW62oazENwz+pW/hUd6q30KyFGj81l36jPy5zKaMm+9/C+WJM6nN3afbJuy3GkgrSF+3acLrtBoSlPUy7l9vU1XV/zbcrznNNSZz7V+9D7Cmvraa0z+Zc5zUHNUplWlVLpe7VhtDhYvG/Rt4fxe5PG/hl1FtvdhA338ptVs9ITasMYzud4fvKU6s+YaQg5Ro1JQnBzIULfEzF6XLUJ5yKexctA9pJLT9/ry/L8fX7e9R6Wpn0dzm4TgGQ/PVPlbnr6R9rlu7SjLMPrZY7nnJel9v9OtzL5qVajOZU5SW3Nztbnu6ttW2G7mOgt1a+UDL3ZMFgc6uCS6V2Mtsz68Cmjcj84v622cPdyzKZqpTk/hNMp3C55nj3n+kSEaMPoY+kDybou09p19+CBiNEjawuWWi54q0bT68v88jx//7/pv/9dXr6n6zXdbq2HNP1Yjerauv/wyffyZu1NOc5Wd/tuPWiZkFCH0eZajaYknt3b4iXdVobWSfi1czN7Slnn1iWSfVlsmnQdy7YgZmr6dgR764j82GdoN1l062poxWnp9tyXotPkKbWvBxuGfDrl5WQ5t5mw5a44dcq7IEYPbNtSY2vU53lKt9tyfV1enufn7/P3/87P/00vL22saYvRdsaMdZWLHO6swvdjOy4iuS7flFSnx5Z5CLmuDc27Gfh1iP4nO+OXRr1Iu7/sKeUw6xS3OZVlZGl7g6lP+Ie/xdzZteW3dWvlaM0sRBuijacwXXxZRKQEqI1jOp3DPNd9Azy7uJZ/TIf67X8hxOjBteWJ+yQt7dxr6yH9/n15fU7Xa5pqu1721ehdTbrGzocWXD/00u02AygT4HO9bLuTSJuEcD+jS+9K61ZWltuWu9XsmrJbUlvUrFagZfBa7wf67x7Qh4Zpm30l6zLZ+yQVlTJX1IYxnCZfFnFvfzyn8y0vdThum0p8pHeHr4cY/QzKos86bLLUmnS6pWvrJ315Wa6veVq7R7OolGVC+83kP/owfvDmId2FRT3sbWWRtFm0bfp92x9qNyF2vzy+BK5mz2XF1LLNstLd6PxdRSzHqkZFtoa87w5fVc0sRhtmTzVD03jKl1tui75ym0rcdgk42HF9LcTosbVRhdrfl+smcm3zjlu6leHsa7pecxmvT8tPqtE3rdej8u3K7z/ZJdw2L/6XtWRt+bbeDZe0/nz5zttVskfl+y7R/VtICB5jaXmomg1j3YKg9I8vdxnaOkFI0vdCjB7dVqHl0klaRmCWvA6/zHOabmWuZZ5nL7OC7tJz37R/c9cf4X+n15vdMvf9n78dffez6O8Hjn7jyI/w5LQm/TbSWLa5UlULdXqTqsVY/hl4meHQdhds/2K2bavwTojRg9uvqm4vjPIiKYMwy5Ln3Yh2idFahLUewG0bi+OXX7KtvFKRMjN0XUHgZVhpP7B0P7J0//k20fJu+6vf31Hwo20xet+hoVIWtoqqWahThtMaoLu2PM35fwQxeny7fdLW/UbLkEtKOSfPKae2lVxKua46V9esWmJIRdtM9UMkqf/8C2uxuVsq2g5BpE4S3U+3vz+Wdce87ZQhJYd+2KFVflgU9JNn5QBPlLcNu7YHX6tRcXdVT5bb/LC2sX+WWoO2ba4P2OH75RCjn8BuO1G5f1G5ZJf1lVO2JimXqirqdZ15bdT7GjTHVF7wWkOiPmaxMjm0bO/8ezsV3Zel+xOKvAnTn93iT770Ac/I1py/j1FRr3NC26yGbVtrhub/aZwZFAC6UI1+AndD7bo7CYeqmNZ9zssiazN3223ru13Kp2rU665R3/a1v5+o9KdP2PZXqO5XQLbTN6l+lka9urq6u641Zh1iKr9uFTVVlbLj/d2v+6Mf/L8JMXp8u3Hqtml8SUwNwSyoBQsxh6hh0ZxN3K2cq+0rDDHJfojpTTa82bJon4m+bf6kYiIu2qYKfaohJhUvGdqa6rabfh81RAt1z2YNphZ0fU9t+wVw1uV/ADF6cPshaauvDWsrGkPQGG0YyqV7FlE3+xdNePpVGt7tQ/p24dZvzaA8wpPzpxOerPzqy27NsUWqhRqmdzu64n0Ro0fXzl1WI7SdMaJsS1F2Ox/CeGq7+1hO4d8y/f5/PHH7fQLv1zh9ien3dV+S8VR2vLdh0DhYXMO0velueYr3Qowem677M6lqPWGZlR0ohtGGUzidwunsKbm4mmmM9nUXg257c/gP2boPyv2GLPXS9n3EX2gx6BhOp3A+h9MpjKcwjnUPwLoN4Lr9ymd51/isiNHPQLVuq1Fa8XEoZUg4n8LtEudZxNUsxeFrb01Szpmsa2O33aRel4Gj9WDLM1bOtGFrv+HX25rkFM+XcL6E89nKrv7DaDFauEtSMvRdEaMHtyug6ol3yhkjTuF8jtNTnhf3rGYWx/ClN8qTtEhSEdlt8rSfW15npLdxONu6j0MoJ33T8EU3yjtfhqdv8elbvFzC+RzGk8VRy+mntG3vf6jf+5dDjB6YrmPOuwxtBUhbPu9qmobxa2/brMucZ826yFKiREXytm+L7A9OpEwAqpV7Ld4tDmUs7mtu23x5Gr79EZ++xfNTOJ3DONYT9pUkbedQxTshRo9M21LyeuIdjUMYx3w652UZSuNdzYYhnb72SUSCTHWdSKlWVbNnaR2HNVrqm45Z7Ueu7zpDGE+lfrc6GvMVTyJyvsSnb8O3/8Snb/F8sdO5NO3b3NJ19tiHHtjXRYweVylFRUXURM1CaI24pW2mqRpCGMd0+cKntAv7k8hrzmrJs64dh2sD38W2EbW1WBtP4XQO50u4XMLpHE7n1nv4BU9pF5++xadv4XIJp3L66KgW6rT8mqCH+QfwtRCjx1YanbY16sM41kGkOlw7pNPpq55gWWMUtbpLYNkh0BbRWpm63K2O3861vDXqhzCMdjqHyyU+fYuXp3C+hNP5y55g+XwJl0s8X8JajYZQ3iqO8wb6JRGjB9ca5hY0RBsGzzm4q2qdOTiewnxpvaL1TBt3qx/XpvyRXkm7yYxt4L206Jclz1M5r/IyjBqCiLRt/1NeFl3q6JBuG+Dt9xKsY2tqZnU4bgynXdfh5SlcnmqSlt7DMta0+unGJR/Jd921bS5tHRtrK9litDiGcbTTuUyAC6dTGEaNg66LROWQM96+CmL06MoLRoKbB4lD3eOorl8aw6nUoXW38/tTFcmuO2z3yYfxrSJWrX12JUZLvZlSnpc0XdP1uownjVFU3bMvdbd/m2O2oHXnJ9nPJNWyNMnb/ITS4B2GdQQmPn0b/vh/8du30ntYW/fhvl1f52ZmuVsu+pHP2LYg4c0sgjphyzRYmYdgZTnTMNowhmG0sSxtKvPwVahH3xMxemDa9tUwFTEJoSwIFVMLIQ+Dl1Pu1L0m83b+sh/uZ/3sQ4+nDKnrtjmA7U+d5KVFn27XZXwpwyPi4mnJ05RuV7uNGm6llbrd3zofX9vF1jdaqvUywfYSn77FP/4Yvv1n+PZHfHoK50sYT3WgaZ0PVE8d2M779PFP2r7Q/kE5zG1hW7B1HkKsy0NLrwV16HsjRo9u3XNTTEzqqL3HaKl1F7bzZa7rf7Y5QG9Xr3x8jNY3h7ayaB2W9pxzSnme7DpqKHWo+7Kk2y2Mr2tPn94NCvluiGlr1Ndat3SDtHZ9OF/i5dvw7Y/hj/+U1r2dTlabvVuM1hVTvvaPfngAbRtRr2m628FLRNs+T+XJKZFa58aGtVFPMfquiNFPwmydSC9mmoOHvJ7/crev8/5V9yYEDvFCqpM7W5t0nSFZGu9pHtRMRDynvMzpdg1tWU7JBVlXuMpubtKbYk3LfKC137D1kJ7P4XIJl6faSXo6WRzkTYzmu1nux+BvrtfnsW0i2Br4Vmr8unarDEO92VsA74EYPTZVKWtz3N1My0JA1/r5bq+Kv3KKoQ+egP/j/qd1Ok9MaibunlKep3A7lQwtc+a3UlTW6TvbNCAV2Y+wq7QRGFuXzw61gV8GYc7nGqNq+7Myr2d/++gg/b3f0d0qtd12AftNZsnQ90eMHl4588faT6rW5jZ62Y9yHQ/R7XX35hV4rJeQ6nq1W83k4hZExHKyedrNkw9tPH3dlnh3X+u89Lv73wo0ae3ctpxpqMMvQy1y2+BSeSDrligHe8rWh7g7yu2pk/3s+m171vUPZOh7I0Y/gzaOXGoxF9e1c/BuOPlILdE/PZ776/b6z1k8W4y1CV8r0G1LkTcbN+931aunedt3Z9Qsta3HsCyuL3la/5bYToR31xnyeU7prvefbttWvdmxFe+KGP082uth9xo5zkTxBxyXhKB5zbuwbstU9s1sbfldi/6u3e0u92Np25Yu2u5q3SK+7RhfBv1V29nyPvqp6H0m5fMfw6dEjH5qX26VtJaR5XUju/U8TL+xvcZP31F2a8m3cRir4Xr3c1/smcQ/iDOD4sD+rNZ+s4fm/07Bo8ypx5dDjOJQ2li5r9sa7Rfw/CpW/3zfDW8jUe73w/HAQxCjOJJ1qHzdXvPtWLz/lZG07bb1rtrdHm5uKD4zYhSHsm18J7JutCk/DCj93l3J/uSab2pbMhQPQ4ziMLYz2a3t7vsG+F+Kvh9u5GuA0q7HQxGjOBBf93j3bTZn+cZfvqfdXa6h7Pvl8hSkeBBiFEdxN/jT+jLlbaD+tXssV/Vyv3XLgfZmxqdHjOJIfDct6Sfh+deT7yf1rL8d/wf6EKM4mrWE9J99/df+ZCrom42vfvlXAH8HMYp/Jxr1eBhiFP9CnLcdj0SM4pgeGnJHOi8qvh5iFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjOKr8I9+APi3IkYBoAsxis9CP/oBAD9HjAJAF2IUn8X/6vukWsUHIUbxaf1+bjrDT3hHxCg+id8qRpWiFP88YhSfwe9Xk9pxW+BvIUbxefivMtFF3Mu3S/vdf3Yb8hTvgxjFMXm99JKM9dLFxd3Fy8X2Ld8C07cv+g/RSZTi8eJHPwDg10oMuvsanbleimfP2T17ziIikjVr/aO75/Lja5jWP7QUJUzxSMQoDqZG51ZUlgpUajJmz+XDS1x6dhFXVVfV+q0snt3rZY3QNUO91bnAgxCjOKDaPt+34929VJrirRTNa1aWIfq1CM3rxdobsJW1H31s+HqIURzR/aiQ74K1FZeytdbbz7rUPlPZonMrPclPvBeGmHBE+uZ6nRCqIqqiIqKiupsoqvX7uvt5fXt3wrRSvAOqURxTzciWmOXP2rJzDU2twbkLVtX28+Wq3ovKFrLAIxGjOJytsNSViZqaiW2XaqG16F1VtX7x/mdUVU3bXbHMCe+BGMWxaCkja3iqqGkIakFD0BAsRI3RYvQUPbup1AlPqmbBYvlu0BAtxHKTFq8tSXfFKfAQxCiOpPZzqpQAtWAlPYdow2DDaONo82jL4p5FzVNYY1QtWIzhdLLxFMbRhsGGQeOgcahBbEFqfdqa/MAjEKM4FJXSPFfTYBqClvQcxjCewumU57OnRVzULMfZU3LP4iKqGsxitPEUT+dwvoTzJZzO4XQK42DDYDGWylTM1n5X4CGIURyJti7REDREi4MNQxjHcD6H6RKXudaeFmwY8nwfo1ZidAync7w8xctTPF/C6Wzj2UpxGmsbX9RkG9AHehGjOBStg0UhWIw2DGE8hfM53i55nj0nEVEzi0Oabr4sb2JUy01O53i+xKdv8elbvDzF8zmMJxvGXeu+9JOSongMYhSHUaOtxmjJRBtP4XwJ0zTkLCKqQeNg4ynMU4nRsmhUVUVNY7DYkvfyVJI0XEpNOlocLEQNpRolRPEwxCgOpcxbChqClbg8n/M8DSmJiJhZHMLplKZbnmdflro8VEpvQKthxzGM53g5h8tTvHyLl2/hfGkFaVQLZSLURx8pvg5iFEehIt46Ri0ONo4hLZ4WT1lE1IINYzqd83RL0+zL2jHq4rsYDaHWsKdTOJ3D5RIv3+LTUzhfyvC9hqhllIkkxYMQozgQVanTPEMMwyip7oOnZjaM4XxO0y1Pc17mEq+ec107X+YxmdnaGzCMNUnP53B+CqezjSeLg0WqUTwYMYpDUW1tc/Hs7lGkpuo45nnO812G1mq03lDFtHUIlCQtU01PbebTWo0GIUfxOMQojqQ06i1ocHOXMnYUTEPM4+jLkpelZWjaNmauNy0z9rUuXgqxLmoq006HkqFDGalXGvV4HGIUB6IiYipuFkIWMa2LQXOMnlL9yMlzlux1qtO2A16J4HITa+tHo8VgYShLSEvCtpF64DGIURxGjTZTK1fqpmrmOVocSnq2c4Tktrvo7tay7WZSZk1JHfRvQ/9lMWj5YLYTHkfZDhwH4nVvZvHsu7OGrNG5P5Pdj/9yW5KueWrlspaoVr8iSqMej0SM4mB8O73nFpdbbq6navrFzddVntq2KV0/uduflAzFwxCjOKT7f5b+sy/+lh+3ciJA8WjEKAB04VxMANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDoQowCQBdiFAC6EKMA0IUYBYAuxCgAdCFGAaALMQoAXYhRAOhCjAJAF2IUALoQowDQhRgFgC7EKAB0IUYBoAsxCgBdiFEA6EKMAkAXYhQAuhCjANCFGAWALsQoAHQhRgGgCzEKAF2IUQDo8v8B6Hzg7leP+qYAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjMtMDktMDlUMDU6NDk6MjYrMDA6MDBGyoGtAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIzLTA5LTA5VDA1OjQ5OjI2KzAwOjAwN5c5EQAAACh0RVh0ZGF0ZTp0aW1lc3RhbXAAMjAyMy0wOS0wOVQwNTo0OTo0MCswMDowMMU9JHMAAAAASUVORK5CYII=");
             }
            .extension{
                border: 1px solid #ccc;
                padding-left: 40px; color: #c62917;
                height:50px;
            }
            li.extension >a.create:hover{
                background-color: #f0f0f0;
            }
            li.extension > a{
                text-align: center;
                display: flex;
                line-height: 40px;
                padding-right:37px;
                justify-content: center;
                color: #c62917; background-repeat: no-repeat; background-position: left top 6px; background-size: 45px 30px;
                font-size:17px;
            }
            .extension:hover{
                cursor: pointer;
                background-color: #f0f0f0;
            }
            #thead{
                background-color: #f2f2f2;
            }
            #thead tr{
                height: 40px;
            }
            #thead tr th, #thead tr td{
                border-width: 1px;
                border-style: solid;
                border-color: #d6d6d6;
                color: #a6a6a6;
                font-weight: normal;
                text-align: center;
            }
            tbody{

                background-color : transparent;
            }
            input {
                width: 100%;
                height: 35px;
                margin: 5px 0px 10px 0px;
                border: 1px solid #e9e8e8;
                padding: 8px;
                background: #f8f8f8;
                outline-color: #e6e6e6;
            }

            textarea {
                width: 100%;
                background: #f8f8f8;
                margin: 5px 0px 10px 0px;
                border: 1px solid #e9e8e8;
                resize: none;
                padding: 8px;
                outline-color: #e6e6e6;
            }

            table{
                width:100%;
                border: 2px solid #d2d2d2;
                border-collapse: collapse;
                font-size: 0.9em;
            }
            th, td{
                border: 1px solid #d2d2d2;
                border-collapse: collapse;
            }
            th{
                height: 5px;
                width : 100px;
            }
            td {
                position: relative;
                width: 200px;
                height: 60px;
                margin: 10px 10px 0 10px; font-size: 14px; line-height: 20px;
            }
            #table-container {
                flex: 1;
                margin-left : 0.4cm;
                margin-top:0.4cm;
                margin-right : 0.4cm;
                overflow: hidden; /* 내용이 넘치면 숨김 처리합니다. */
            }
            #container {
                display: flex;
                height: 100vh;
            }
            aside {
                width: 20%;
                height: 100%;
                display: block;
                background-color: #f8f8f8;
                flex-direction: column;
                margin-left : 0.4cm;
                margin-top:0.4cm;
                margin-right : 0.4cm;
            }
            #now_Schedule{
                color: #262626; font-size: 18px; font-weight: bold;
            }
            #now_Schedule{
                background-color : #ffffff;
                flex: 1;
                border: 1px solid #ccc;
                padding: 10px;
                margin-top: 0.5cm;
                height:15%;
            }
            #the_credit_view{
                background-color : #ffffff;
                border: 1px solid #ccc;
                padding: 10px;
                height:15%;
            }
            #list_Schedule{
                border: 1px solid #ccc;
                background-color: #ffffff;
                margin-top : 0.3cm;
                hegiht:120px;
            }
            #button-container {
                position: fixed;
                bottom: 5px; /* 아래에서 5px 떨어진 위치 */
                left: 50%; /* 가운데로 이동 */
                transform: translateX(-50%); /* 가운데 정렬 */
                width: 300px; /* 원하는 가로 크기 */
                text-align: center;
                z-index: 1; /* 다른 요소 위에 표시 */
            }
            #semesters{
                width:100%;
                border:0;
                background-color:transparent;
            }
            .shared-btn {
                background-color: rgb(89, 117, 196);
                color: white;
                width: 100%; /* 버튼을 가로 중앙에 맞추기 위해 100%로 설정 */
                height: 50px;
                font-size: 17px;
                border: none;
                border-radius: 5px;
                margin: 0 auto; /* 가운데 정렬 */
            }
            #subjects {
                position: fixed;
                bottom: 0; /* 아래쪽에 밀착되도록 설정 */
                left: 0;
                width: 100%;
                height: 50%; /* 전체 높이의 50% 비중 설정 */
                background-color: #f8f8f8;
                overflow-y: auto; /* 내용이 넘칠 경우 스크롤 표시 */
                box-shadow: 0px -2px 5px rgba(0, 0, 0, 0.1); /* 아래에 그림자 추가 */
            }
            li{
                list-style: none;
            }
            #filter {
                text-align: right;
                padding: 10px;
            }
            .row {
                transition: background-color 0.3s; /* 배경색 변화를 부드럽게 만듭니다. */
                background-color: white; /* 초기 배경색을 설정합니다. */
            }

            .row:hover {
                background-color: #f0f0f0; /* 마우스를 갖다대었을 때의 배경색을 설정합니다. */
            }
            .subject_del{
                display: none;
                position: absolute;
                top : 0;
                right : 0;
                sizd:1px;
            }
            td:hover .subject_del{
                display:block;
            }
            .LoadSchedule:hover{
                background-color:lightgray;
                cursor:pointer;
            }
            .LoadSchedule{

                height : 50px;
                text-align: center;
                justify-content: center;
                align-items: center;
                line-height: 1.1cm;
            }
            #closeSetting_schedule:hover{
                cursor:pointer;
            }
            #setting_schedule {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 10cm;
                height: 10cm;
                background-color: white;
                padding: 20px;
                display: none;
                z-index: 1001;
            }

            #delete_Schedule {
                position: absolute;
                bottom: 0.7cm;
                left: 0.7cm;
            }

            #saveSetting_schedule {
                position: absolute;
                bottom: 0.7cm;
                right: 0.7cm;
            }

            #closeSetting_schedule {
                position: absolute;
                top: 0.7cm;
                right: 0.7cm;
            }
            #overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.7);
                display: none;
                z-index: 1000;
            }
        </style>
        <script>
            $(function(){
                var test = $('#subjects').css('display');
                if(test=='block'){
                    $('#searchSubject').css('display', 'none');
                }
            })
            var semesterInteger = [2023,2022,2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010];
            var semesterString =['겨울학기', '2학기', '여름학기', '1학기'];

        </script>
    </head>
    <body>
    <div id="menu">
        <ul>
            <li id="logo">ldg2</li>
            <li><a href="<c:url value='/'/>">Home</a></li>
            <li><a href="<c:url value='/schedule/test'/>">Schedule</a></li>
            <li><a href="<c:url value='/calculator'/>">Calculator</a></li>
            <li><a href="<c:url value='/board/list'/>">Board</a></li>
            <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
            <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
            <li><a href=""><i class="fa fa-search"></i></a></li>
        </ul>
    </div>
    <div id="container">
        <aside>
            <form id="select_Semester">
                <select id="semesters">
                </select>
            </form>
                <div id="now_Schedule">
                    <div class="btnColl">test</div>
                </div>
            <div id="the_credit_view">
                <oi id="credit_view">
                    <li id="majorSum"></li>
                    <li id="cultureSum"></li>
                </oi>
            </div>

                <div id="list_Schedule">
                    <ol id="list_Schedule2">

                    </ol>
                </div>
        </aside>
        <div id="table-container">
            <table height="600" style="color: #121212">
                <tr width=19% id="thead">
                    <th></th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                </tr>
                <tbody>
                <tr class="BRow">
                    <th>오전 9시</th>
                    <td id="mon-1"></td>
                    <td id="tue-1"></td>
                    <td id="wed-1"></td>
                    <td id="tur-1"></td>
                    <td id="fri-1"></td>
                </tr>
                <tr class="BRow">
                    <th>오전 10시</th>
                    <td id="mon-2"></td>
                    <td id="tue-2"></td>
                    <td id="wed-2"></td>
                    <td id="tur-2"></td>
                    <td id="fri-2"></td>
                </tr>
                <tr class="BRow">
                    <th>오전 11시</th>
                    <td id="mon-3"></td>
                    <td id="tue-3"></td>
                    <td id="wed-3"></td>
                    <td id="tur-3"></td>
                    <td id="fri-3"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 12시</th>
                    <td id="mon-4"></td>
                    <td id="tue-4"></td>
                    <td id="wed-4"></td>
                    <td id="tur-4"></td>
                    <td id="fri-4"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 1시</th>
                    <td id="mon-5"></td>
                    <td id="tue-5"></td>
                    <td id="wed-5"></td>
                    <td id="tur-5"></td>
                    <td id="fri-5"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 2시</th>
                    <td id="mon-6"></td>
                    <td id="tue-6"></td>
                    <td id="wed-6"></td>
                    <td id="tur-6"></td>
                    <td id="fri-6"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 3시</th>
                    <td id="mon-7"></td>
                    <td id="tue-7"></td>
                    <td id="wed-7"></td>
                    <td id="tur-7"></td>
                    <td id="fri-7"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 4시</th>
                    <td id="mon-8"></td>
                    <td id="tue-8"></td>
                    <td id="wed-8"></td>
                    <td id="tur-8"></td>
                    <td id="fri-8"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 5시</th>
                    <td id="mon-9"></td>
                    <td id="tue-9"></td>
                    <td id="wed-9"></td>
                    <td id="tur-9"></td>
                    <td id="fri-9"></td>
                </tr>
                <tr class="BRow">
                    <th>오후 6시</th>
                    <td id="mon-10"></td>
                    <td id="tue-10"></td>
                    <td id="wed-10"></td>
                    <td id="tur-10"></td>
                    <td id="fri-10"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div id="overlay" style="display: none;"></div>
    <div id="setting_schedule" style="display: none">
        <a id="closeSetting_schedule">X</a>
        <h3>시간표 설정</h3>
        <p>
            <label>이름</label>
            <input type="text" id="now_name" value="">
        </p>
        <button id="delete_Schedule">삭제</button><button id="saveSetting_schedule">설정 저장</button>
    </div>

    </div>
    <div id="button-container">
            <button id="searchSubject" class="shared-btn">수업 목록 찾기</button>
    </div>
    <div id="subjects" style="display:${not empty List ? 'block' : 'none'}">
        <div id="filter"><button id="closeSearchSubject" class="shared-btn">닫기</button></div>
        <table>
            <thead>
            <th><div>학수번호</div></th>
            <th><div>교과명목</div></th>
            <th><div>이수</div></th>
            <th><div>학점</div></th>
            <th><div>교수</div></th>
            <th><div>강의 시간</div></th>
            <th><div>강의실</div></th>
            <th><div>정원</div></th>
            <th><div>비고</div></th>
            </thead>
            <tbody id="subject_list">
<%--            <c:if test="${not empty List}">--%>
<%--                <c:forEach var="subjectDto" items="${List}">--%>
<%--                    <tr class="row" id="subjectAdd${subjectDto.course_num}">--%>
<%--                    <form id="addSubject${subjectDto.course_num}" action="" method="">--%>
<%--                    <td><div>${subjectDto.course_num}</div></td>--%>
<%--                    <td><input type="hidden" name="subject_name" value="${subjectDto.subject_name}">${subjectDto.subject_name}</td>--%>
<%--                    <td><input type="hidden" name="major" value="${subjectDto.major}">${subjectDto.major}</td>--%>
<%--                    <td><input type="hidden" name="credit" value="${subjectDto.credit}">${subjectDto.credit}</td>--%>
<%--                    <td><input type="hidden" name="professor" value="${subjectDto.professor}">${subjectDto.professor}</td>--%>
<%--                    <td>--%>
<%--                        <input type="hidden" name="subject_first_day" value="${subjectDto.subject_first_day}">--%>
<%--                        <input type="hidden" name="subject_first_hour" value="${subjectDto.subject_first_hour}">--%>
<%--                        <input type="hidden" name="subject_second_day" value="${subjectDto.subject_second_day}">--%>
<%--                        <input type="hidden" name="subject_second_hour" value="${subjectDto.subject_second_hour}">--%>
<%--                        <input type="hidden" name="subject_third_day" value="${subjectDto.subject_third_day}">--%>
<%--                        <input type="hidden" name="subject_third_hour" value="${subjectDto.subject_third_hour}">--%>
<%--                        <input type="hidden" name="subject_fourth_day" value="${subjectDto.subject_fourth_day}">--%>
<%--                        <input type="hidden" name="subject_fourth_hour" value="${subjectDto.subject_fourth_hour}">--%>
<%--                        <div>--%>
<%--                            ${subjectDto.subject_first_day}${subjectDto.subject_first_hour} ${subjectDto.subject_second_day}${subjectDto.subject_second_hour} ${subjectDto.subject_third_day}${subjectDto.subject_third_hour} ${subjectDto.subject_fourth_day}${subjectDto.subject_fourth_hour}--%>
<%--                        </div>--%>
<%--                    </td>--%>
<%--                    <td><input type="hidden" name="place" value="${subjectDto.place}">${subjectDto.place}</td>--%>
<%--                    <td><div>${subjectDto.nop}</div></td>--%>
<%--                    <td><div>${subjectDto.etc}</div></td>--%>
<%--                    </form>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </c:if>--%>
            </tbody>
        </table>
    </div>
    <script>
        $(document).ready(function(){
            LoadSemester();
            updateSchedule_name(function(){

                $('#list_Schedule2').on('click', '.LoadSchedule', function(){
                    $('.LoadSchedule').css("background-color", "");
                    $('.LoadSchedule').css("color", "");
                    $('.LoadSchedule').css("font-size", "");
                    $(this).css("background-color", "#f8f8f8");
                    $(this).css("color", "#c62917");
                    $(this).css("font-size", "16px");
                    var clickedLi = $(this).attr("id");
                    resetScheduleCells();
                    updateCellRe(clickedLi);
                    $('#now_Schedule').html(clickedLi + '<hr><button id="option_Schedule" class="option_Schedule">설정</button>');
                    readMajorAndCredit();

                })
                $('#select_Semester').on("change", function(){
                    var selecteOption = $(this).find("option:selected");
                    var selecteOPtext = selecteOption.text();
                    console.log(selecteOPtext);
                    resetScheduleCells();
                    updateSchedule_name();
                })
                $('#subject_list').on('click', 'tr.row', function (){
                    var scheduleHtml = $('#now_Schedule').html();
                    var schedule_name = scheduleHtml.split('<')[0];
                    var schedule_semester = $('#select_Semester option:selected').text();
                    console.log(schedule_name);
                    var clickedRow = $(this);
                    getSchedule_set(function(schedule_set){
                        var third_day = clickedRow.find('input[name="subject_third_day"]').val();
                        var third_hour=clickedRow.find('input[name="subject_third_hour"]').val();
                        var fourth_day = clickedRow.find('input[name="subject_fourth_day"]').val();
                        var fourth_hour=clickedRow.find('input[name="subject_fourth_hour"]').val();
                        console.log(schedule_set);
                        console.log(clickedRow.find('input[name="subject_first_day"]').val(),
                            clickedRow.find('input[name="subject_first_hour"]').val(),
                            clickedRow.find('input[name="subject_second_day"]').val(),
                            clickedRow.find('input[name="subject_second_hour"]').val())
                        var formData = {
                            subject_name: clickedRow.find('input[name="subject_name"]').val(),
                            major: clickedRow.find('input[name="major"]').val(),
                            credit: clickedRow.find('input[name="credit"]').val(),
                            professor: clickedRow.find('input[name="professor"]').val(),
                            subject_first_day: clickedRow.find('input[name="subject_first_day"]').val(),
                            subject_first_hour: clickedRow.find('input[name="subject_first_hour"]').val(),
                            subject_second_day: clickedRow.find('input[name="subject_second_day"]').val(),
                            subject_second_hour: clickedRow.find('input[name="subject_second_hour"]').val(),
                            place: clickedRow.find('input[name="place"]').val(),
                            subject_third_day : clickedRow.find('input[name="subject_third_day"]').val(),
                            subject_third_hour :clickedRow.find('input[name="subject_third_hour"]').val(),
                            subject_fourth_day:clickedRow.find('input[name="subject_fourth_day"]').val(),
                            subject_fourth_hour:clickedRow.find('input[name="subject_fourth_hour"]').val(),
                            cell_color : getRandomLightColor(hexColors),
                            schedule_set : schedule_set,
                            schedule_semester : schedule_semester
                        };
                        var formDataV2={
                            subject_name: clickedRow.find('input[name="subject_name"]').val(),
                            major: clickedRow.find('input[name="major"]').val(),
                            credit: clickedRow.find('input[name="credit"]').val(),
                            professor: clickedRow.find('input[name="professor"]').val(),
                            subject_first_day: clickedRow.find('input[name="subject_first_day"]').val(),
                            subject_first_hour: clickedRow.find('input[name="subject_first_hour"]').val(),
                            subject_second_day: clickedRow.find('input[name="subject_second_day"]').val(),
                            subject_second_hour: clickedRow.find('input[name="subject_second_hour"]').val(),
                            subject_third_day: "",
                            subject_third_hour:"",
                            subject_fourth_day:"",
                            subject_fourth_hour:"",
                            place: clickedRow.find('input[name="place"]').val(),
                            cell_color: getRandomLightColor(hexColors),
                            schedule_set : schedule_set,
                            schedule_semester : schedule_semester
                        }

                        if(third_day==="" && third_hour==="" && fourth_day==="" && fourth_hour===""){
                            $.ajax({
                                url : "<c:url value='/schedule/add'/>",
                                type : "POST",
                                data : formDataV2,
                                success : function(response){
                                    if(response=='possible'){
                                        updateCellRe(schedule_name);
                                        readMajorAndCredit();
                                    }
                                    else{
                                        alert("같은 시간대에 이미 수업이 있습니다.");
                                    }
                                },
                                error:function(error){
                                    alert("오류 발생");
                                }
                            })
                        }
                        else{
                            $.ajax({
                                url : "<c:url value='/schedule/add'/>",
                                type : "POST",
                                data : formData,
                                success : function(response){
                                    if(response=='possible'){
                                        updateCellRe(schedule_name);
                                        readMajorAndCredit();
                                    }
                                    else{
                                        alert("같은 시간대에 이미 수업이 있습니다.");
                                    }
                                },
                                error:function(error){
                                    alert("오류 발생");
                                }
                            })
                        }
                    })
            });
            $('#list_Schedule2').on('click', "#scheduleAdd" ,function(){
                var scheduleHtml = $('#now_Schedule').html();
                var schedule_name = scheduleHtml.split('<')[0];
                console.log(schedule_name);
                addNewSchedule(schedule_name);
            })

            function addNewSchedule(now_schedule){
                var schedule_semester = $('#select_Semester option:selected').text();
                $.ajax({
                    url:"<c:url value='/schedule/AddNewSchedule'/>",
                    type : "get",
                    data :{now_schedule : now_schedule, schedule_semester : schedule_semester},
                    success:function(response){
                        if(response=="possible"){
                            alert("시간표 생성 성공");
                            updateSchedule_name();
                        }
                        else{
                            alert("시간표 생성 실패");
                        }
                    },
                    error:function(error){
                        alert("에러가 발생했습니다.");
                    }
                })
            }
                $('#now_Schedule').on('click', '#option_Schedule' ,function(){
                    var scheduleHtml = $('#now_Schedule').html();
                    var schedule_name = scheduleHtml.split('<')[0];
                    $('#overlay').show();
                    $('#setting_schedule').css('display', 'block');
                    $('#now_name').attr('value', schedule_name);
                })
                $('#closeSetting_schedule').on('click', function(){
                    $('#setting_schedule').css('display', 'none');
                    $('#overlay').hide();
                })
                $('#saveSetting_schedule').on('click', function(){
                    var schedule_name =$('#now_name').val();
                    var scheduleHtml = $('#now_Schedule').html();
                    var old_schedule_name = scheduleHtml.split('<')[0];
                    var schedule_semester = $('#select_Semester option:selected').text();
                    $.ajax({
                        url:"<c:url value='/schedule/update'/>",
                        type:"post",
                        data:{schedule_name : schedule_name,
                              old_schedule_name : old_schedule_name,
                        schedule_semester : schedule_semester},
                        success:function(response){
                            if(response=="possible"){
                                alert("시간표 설정 변경에 성공하였습니다.");
                                $('#setting_schedule').css('display', 'none');
                                $('#overlay').hide();
                                $('#now_Schedule').html(schedule_name+'<hr>')
                                $('#now_Schedule').append('<button id="option_Schedule">설정</button>');
                                updateCellRe(schedule_name);
                                readMajorAndCredit();
                                location.reload();
                            }
                            else{
                                alert("시간표 설정 변경 실패");
                            }
                        },
                        error:function(error){
                            alert("에러");
                        }
                    })

                })
                $('#setting_schedule').on('click', '#delete_Schedule',function(){
                    var scheduleHtml = $('#now_Schedule').html();
                    var schedule_name = scheduleHtml.split('<')[0]
                    var schedule_semester = $('#select_Semester option:selected').text();
                    if(confirm("시간표를 삭제하시겠습니까?")){
                        $.ajax({
                            url : "<c:url value='/schedule/deleteSchedule'/>",
                            type:"post",
                            data:{schedule_name : schedule_name,
                            schedule_semester : schedule_semester},
                            success:function(response){
                                if(response=="possible"){
                                    alert("시간표 삭제에 성공했습니다.");
                                    location.reload();
                                }
                                else{
                                    alert("실패");
                                }
                            },
                            error:function (error){
                                alert("시간표 삭제 에러");
                            }
                        })
                    }

                })
            $(document).on('click','.subject_del', function(){
                var arr =$(this).attr('id').split(',');
                var subject_name = arr[0];
                var sno = arr[1];
                var cellID = arr[2];
                var arr = cellID.split('-');
                var hour = arr[1];
                var named = $('.subject-cell-'+sno);
                var rowspan = parseInt($('.subject-cell-'+sno).attr('rowspan'));
                if(confirm("이 수업을 삭제하시겠습니까?")){
                    deleteSubject(subject_name, sno);
                    $('.subject-cell-'+sno).removeAttr('rowspan');
                    if(rowspan>0){
                        for(var i=hour; i<=rowspan; i++){
                            $('#'+arr[0]+'-'+i).removeAttr('style');
                            $('#'+arr[0]+'-'+i).show();
                        }
                    }
                    named.each(function(){
                        var name = $(this);
                        name.empty();
                        name.removeAttr('style');
                    })
                }
            })

<%--            수업 목록 보기 를 누르면 리스트가 나오고, 버튼은 사라지게 만들기--%>
            $('#searchSubject').on('click', function() {
                var scheduleHtml = $('#now_Schedule').html();
                var schedule_name = scheduleHtml.split('<')[0];
                console.log(schedule_name);
                $('#subjects').css('display', 'block');
                $(this).css('display', 'none');
                $.ajax({
                    url:"<c:url value='/subject/read?schedule_name="+schedule_name+"'/>",
                    type:"get",
                    success:function(data){
                        var subject_list = data;
                        for(var i=0; i<subject_list.length; i++){
                            var course_num = subject_list[i].course_num;
                            var subject_name = subject_list[i].subject_name;
                            var major = subject_list[i].major;
                            var credit = subject_list[i].credit;
                            var professor = subject_list[i].professor;
                            var subject_first_day = subject_list[i].subject_first_day;
                            var subject_first_hour = subject_list[i].subject_first_hour;
                            var subject_second_day = subject_list[i].subject_second_day;
                            var subject_second_hour = subject_list[i].subject_second_hour
                            var place = subject_list[i].place;
                            var nop = subject_list[i].nop;
                            var etc = subject_list[i].etc;
                            var subject_third_day =subject_list[i].subject_third_day;
                            var subject_third_hour = subject_list[i].subject_third_hour;
                            var subject_fourth_day = subject_list[i].subject_fourth_day;
                            var subject_fourth_hour = subject_list[i].subject_fourth_hour;
                            createSubjectTR(course_num, subject_name, major, credit, professor, subject_first_day, subject_first_hour,
                            subject_second_day, subject_second_hour, place, nop, etc, subject_third_day, subject_third_hour, subject_fourth_day, subject_fourth_hour);
                        }
                    }
                })
            });

            $('#closeSearchSubject').on('click', function(){
                $('#subjects').css('display', 'none');
                $('#searchSubject').css('display', 'block');
            });
            //테이블의 행을 누르면 add하기.


                // $(this).find('td').not(':last-child').on('click', function(){

            })
            function createSubjectTR(course_num, subject_name, major, credit, professor, subject_first_day, subject_first_hour,
            subject_second_day, subject_second_hour, place, nop, etc, subject_third_day, subject_third_hour, subject_fourth_day, subject_fourth_hour){
                if(subject_third_day==null && subject_third_hour==null){
                    subject_third_day = "";
                    subject_third_hour="";
                }
                if(subject_fourth_day==null && subject_fourth_hour==null){
                    subject_fourth_day="";
                    subject_fourth_hour="";
                }
                var tbody = $('#subject_list');
                var tr = $('<tr id="subjectAdd'+course_num+'" class="row">');
                var inputCourse_num = $('<input>').attr("type", "hidden").attr("name", "course_num").val(course_num);
                var tdCourse_num = $('<td>').text(course_num).append(inputCourse_num);
                var inputSubject_name = $('<input>').attr("type", "hidden").attr("name", "subject_name").val(subject_name);
                var tdSubject_name = $('<td>').text(subject_name).append(inputSubject_name);
                var inputMajor = $('<input>').attr("type", "hidden").attr("name", "major").val(major);
                var tdMajor = $('<td>').text(major).append(inputMajor);
                var inputCredit = $('<input>').attr("type", "hidden").attr("name", "credit").val(credit);
                var tdCredit = $('<td>').text(credit).append(inputCredit);
                var inputProfessor = $('<input>').attr("type", "hidden").attr("name", "professor").val(professor);
                var tdProfessor =$('<td>').text(professor).append(inputProfessor);
                var inputSubject_first_day = $('<input>').attr("type", "hidden").attr("name", "subject_first_day").val(subject_first_day);
                var inputSubject_first_hour = $('<input>').attr("type", "hidden").attr("name", "subject_first_hour").val(subject_first_hour);
                var inputSubject_second_day = $('<input>').attr("type", "hidden").attr("name", "subject_second_day").val(subject_second_day);
                var inputSubject_second_hour = $('<input>').attr("type", "hidden").attr("name", "subject_second_hour").val(subject_second_hour);
                var inputSubject_third_day = $('<input>').attr("type", "hidden").attr("name", "subject_third_day").val(subject_third_day);
                var inputSubject_third_hour = $('<input>').attr("type", "hidden").attr("name", "subject_third_hour").val(subject_third_hour);
                var inputSubject_fourth_day = $('<input>').attr("type", "hidden").attr("name", "subject_fourth_day").val(subject_fourth_day);
                var inputSubject_fourth_hour = $('<input>').attr("type", "hidden").attr("name", "subject_fourth_hour").val(subject_fourth_hour);
                var div = $('<div>')
                    .append(inputSubject_first_day)
                    .append(inputSubject_first_hour)
                    .append(inputSubject_second_day)
                    .append(inputSubject_second_hour)
                    .append(inputSubject_third_day)
                    .append(inputSubject_third_hour)
                    .append(inputSubject_fourth_day)
                    .append(inputSubject_fourth_hour);

                var tdSubject = $('<td>').text(subject_first_day+subject_first_hour+" "+subject_second_day+subject_second_hour+" "+subject_third_day+subject_third_hour+" "+subject_fourth_day+subject_fourth_hour).append(div);
                var inputPlace = $('<input>').attr("type", "hidden").attr("name", "place").val(place);
                var tdPlace =$('<td>').text(place).append(inputPlace);
                var inputNop = $('<input>').attr("type", "hidden").attr("name", "nop").val(nop);
                var tdNop = $('<td>').text(nop).append(inputNop);
                var inputEtc = $('<input>').attr("type", "hidden").attr("name", "etc").val(etc);
                var tdEtc = $('<td>').text(etc).append(inputEtc);
                tr.append(tdCourse_num, tdSubject_name, tdMajor, tdCredit, tdProfessor);
                tr.append(tdSubject, tdPlace, tdNop, tdEtc);
                tbody.append(tr);
            }
            function getSchedule_set(callback){
                var scheduleHtml = $('#now_Schedule').html();
                var schedule_name = scheduleHtml.split('<')[0];
                var schedule_semester = $('#select_Semester option:selected').text();
                console.log(schedule_name);
                $.ajax({
                    url : "<c:url value='/schedule/getSchedule_set'/>",
                    type : "get",
                    data : {subject_name : schedule_name,
                    schedule_semester : schedule_semester},
                    success:function(schedule_set){
                        console.log(schedule_set);
                        callback(schedule_set);
                    },
                    error:function(error){
                        alert("오류 발생");
                    }
                })
            }
        })
        function updateCellRe(schedule_name){
            var li = schedule_name;
            if(li=="undefined" || li=="" || li==null){
                li= document.querySelector("#list_Schedule2 li:first-child").getAttribute("id");
            }
            var schedule_semester = $('#select_Semester option:selected').text();
            // var firstLi = document.querySelector("#list_Schedule2 li:first-child");
            // var firstLiId = firstLi.getAttribute("id");
            $.ajax({
                <%--url : "<c:url value='/schedule/read?schedule_name=" + li + "' />",--%>
                <%--url : "<c:url value='/schedule/read?'/>",--%>
                url : "<c:url value='/schedule/read'/>",
                type : "get",
                dataType:"json",
                data:{schedule_name : li,
                schedule_semester : schedule_semester},
                cache : false,
                success:function(data){
                    console.log(data);
                    var schedules = data.scheduleDtoList;
                    var colors = data.color_infoDtoList;
                    for(var i=0; i<schedules.length; i++){
                        var color;
                        var item = schedules[i];
                        for(var j=0; j<colors.length; j++){
                            if(item.sno == colors[j].sno){
                                color = colors[j].cell_color;
                            }
                        }
                        var firstCellID;
                        var secondCellID;
                        var thirdCellID;
                        var fourthCellID;
                        var mon = "mon-";
                        var tue = "tue-";
                        var wed = "wed-";
                        var tur = "tur-";
                        var fri = "fri-";
                        var subject_sno = item.sno;
                        var subject_name = item.subject_name;
                        var tmp = item.subject_first_day;
                        var f_hour = item.subject_first_hour;
                        var tmp2 = item.subject_second_day;
                        var s_hour = item.subject_second_hour;
                        var tmp3 = item.subject_third_day;
                        var t_hour = item.subject_third_hour;
                        var tmp4 = item.subject_fourth_day;
                        var fourth_hour = item.subject_fourth_hour;

                        if(tmp == '월'){firstCellID=mon+f_hour;}
                        else if(tmp == '화'){firstCellID=tue+f_hour;}
                        else if(tmp=='수'){firstCellID=wed+f_hour;}
                        else if(tmp=='목'){firstCellID=tur+f_hour;}
                        else if(tmp=='금'){firstCellID=fri+f_hour;}

                        if(tmp2 == '월'){secondCellID = mon+s_hour;}
                        else if(tmp2=='화'){secondCellID=tue+s_hour;}
                        else if(tmp2=='수'){secondCellID=wed+s_hour;}
                        else if(tmp2=='목'){secondCellID=tur+s_hour;}
                        else if(tmp2=='금'){secondCellID=fri+s_hour;}

                        if(tmp3!="" && tmp4!=""){
                            if(tmp3 == '월'){thirdCellID = mon+t_hour;}
                            else if(tmp3=='화'){thirdCellID=tue+t_hour;}
                            else if(tmp3=='수'){thirdCellID=wed+t_hour;}
                            else if(tmp3=='목'){thirdCellID=tur+t_hour;}
                            else if(tmp3=='금'){thirdCellID=fri+t_hour;}

                            if(tmp4 == '월'){fourthCellID = mon+fourth_hour;}
                            else if(tmp4=='화'){fourthCellID=tue+fourth_hour;}
                            else if(tmp4=='수'){fourthCellID=wed+fourth_hour;}
                            else if(tmp4=='목'){fourthCellID=tur+fourth_hour;}
                            else if(tmp4=='금'){fourthCellID=fri+fourth_hour;}

                            $('#'+firstCellID).css('background-color', color);
                            $('#'+secondCellID).css('background-color', color);
                            $('#'+thirdCellID).css('background-color', color);
                            $('#'+fourthCellID).css('background-color', color);

                            var test = DayAndRowspanCal(firstCellID, secondCellID, thirdCellID, fourthCellID);
                            if(Array.isArray(test)){
                                $('#'+test[0]).html(subject_name).addClass('subject-cell-'+ subject_sno).attr('rowspan', 2).css('text-align', 'center').append(createBtn(subject_name,subject_sno, test));
                                $('#'+test[1]).html(subject_name).addClass('subject-cell-'+ subject_sno).attr('rowspan', 2).css('text-align', 'center').append(createBtn(subject_name,subject_sno, test));
                                $('#'+secondCellID).hide();
                                $('#'+fourthCellID).hide();
                            }
                            else{
                                $('#'+test).html(subject_name).addClass('subject-cell-' + subject_sno).attr('rowspan', 4).css('text-align', 'center').append(createBtn(subject_name,subject_sno, test));
                                $('#'+secondCellID).hide();
                                $('#'+thirdCellID).hide();
                                $('#'+fourthCellID).hide();
                            }
                        }
                        else{
                            $('#'+firstCellID).css('background-color', color);
                            $('#'+secondCellID).css('background-color', color);
                            var test2 =DayAndRowspanCal2(firstCellID, secondCellID);
                            if(Array.isArray(test2)){
                                $('#'+firstCellID).html(subject_name).append(createBtn(subject_name,subject_sno,firstCellID)).css('text-align', 'center');
                                $('#'+firstCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+secondCellID).html(subject_name).append(createBtn(subject_name,subject_sno,secondCellID)).css('text-align', 'center');
                                $('#'+secondCellID).addClass('subject-cell-' + subject_sno);
                            }
                            else{
                                $('#'+test2).html(subject_name).addClass('subject-cell-' + subject_sno).attr('rowspan', 2).css('text-align', 'center').append(createBtn(subject_name,subject_sno, test));
                                $('#'+secondCellID).hide();
                            }
                            if(tmp != tmp2){
                                $('#'+firstCellID).html(subject_name).append(createBtn(subject_name,subject_sno,firstCellID)).css('text-align', 'center');
                                $('#'+firstCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+secondCellID).html(subject_name).append(createBtn(subject_name,subject_sno,secondCellID)).css('text-align', 'center');
                                $('#'+secondCellID).addClass('subject-cell-' + subject_sno);
                            }
                            else{
                                $('#'+firstCellID).html(subject_name).append(createBtn(subject_name,subject_sno, firstCellID)).css('text-align', 'center');
                                $('#'+firstCellID).addClass('subject-cell-' + subject_sno);
                                $('#'+secondCellID).addClass('subject-cell-' + subject_sno);
                            }
                        }
                    }
                },
                error:function(error){
                    alert("실패");
                }
            })
        }
        //랜덤 색깔을 얻어오는 함수
        function getRandomLightColor(colorArray) {
            var randomIndex = Math.floor(Math.random() * colorArray.length);
            return colorArray[randomIndex];
        }
        var hexColors = [
            "#FFE5CC", "#FFCCCC", "#FFFFCC", "#CCFFCC",
            "#FFCC99", "#FF9999", "#FFFF99", "#CCFF99",
            "#99FF99", "#99FFCC", "#99FFFF", "#CCFFFF"
        ];
        function createBtn(subject_name, sno, CellID){
            var btnClass = subject_name;
            var btnContent ='<button name="'+subject_name+'"id="'+subject_name+','+sno+','+CellID+'" class="subject_del">[x]</button>';
            return btnContent;
        }
        function DayCal(first_day, second_day, third_day, fourth_day){
                if(first_day==second_day && second_day == third_day && third_day==fourth_day){
                    return first_day
                }
                else if((first_day==second_day) != (third_day==fourth_day)){
                    return [first_day, third_day];
                }

        }
        function rowspanCal2(first_hour, second_hour, third_hour, fourth_hour){
                if(first_hour+1 == second_hour && second_hour+1==third_hour && third_hour+1 == fourth_hour){
                    return first_hour;
                }
                else if((first_hour+1==second_hour) && (second_hour+1!=third_hour) && (third_hour+1==fourth_hour)){
                    return [first_hour, third_hour];
                }
        }
        function DayAndRowspanCal(firstCellID, secondCellID, thirdCellID, fourthCellID){
            var calArr = [firstCellID, secondCellID, thirdCellID, fourthCellID];
            var dayArr =[];
            var hourArr=[];
            for(var i=0; i<calArr.length; i++){
                var tmp = calArr[i].split('-');
                dayArr.push(tmp[0]);
                hourArr.push(parseInt(tmp[1]));
            }
            var day = DayCal(dayArr[0], dayArr[1], dayArr[2], dayArr[3]);
            var rowspan = rowspanCal2(hourArr[0], hourArr[1], hourArr[2], hourArr[3]);
            if(Array.isArray(day) && Array.isArray(rowspan)){
                var arr=[];
                arr.push(day[0]+'-'+rowspan[0]);
                arr.push(day[1]+'-'+rowspan[1]);
                return arr;
            }
            else{
                return day+'-'+rowspan;
            }
        }
        function DayCal2(first_day, second_day){
            if(first_day==second_day){
                return first_day
            }
            else{
                return [first_day, second_day];
            }
        }
        function rowspanCal3(day, first_hour, second_hour){
            if(Array.isArray(day)){
                return [first_hour, second_hour];
            }
            else{
                if(first_hour+1 == second_hour){
                    return first_hour;
                }
                else {
                    return[first_hour, second_hour];
                }
            }
        }
        function DayAndRowspanCal2(firstCellID, secondCellID){
            var calArr = [firstCellID, secondCellID];
            var dayArr =[];
            var hourArr=[];
            for(var i=0; i<calArr.length; i++){
                var tmp = calArr[i].split('-');
                dayArr.push(tmp[0]);
                hourArr.push(parseInt(tmp[1]));
            }
            var day = DayCal2(dayArr[0], dayArr[1]);
            var rowspan = rowspanCal3(day, hourArr[0], hourArr[1]);
            if(Array.isArray(day) && Array.isArray(rowspan)){
                var arr=[];
                arr.push(day[0]+'-'+rowspan[0]);
                arr.push(day[1]+'-'+rowspan[1]);
                return arr;
            }
            else{
                return day+'-'+rowspan;
            }
        }
        function updateSchedule_name(callback){
            var selectOp = $('#select_Semester option:selected').text();
            if (!selectOp) {
                selectOp = $('#select_Semester option:first-child').text();
            }
            console.log(selectOp);
            $.ajax({
                url:"<c:url value='/schedule/readSchedule_name'/>",
                type:"get",
                data : {selectOp : selectOp},
                dataType :"json",
                success:function(data){
                    var listSchedule2 = document.getElementById("list_Schedule2");
                    while(listSchedule2.firstChild){
                        listSchedule2.removeChild(listSchedule2.firstChild);
                    }
                    $('#now_Schedule').html(data[0]+'<hr>');
                    for(var i=0; i<data.length; i++){
                        var tmp = data[i];
                        $('#list_Schedule2').append(createSchedule(data[i]));
                    }
                    $('#list_Schedule2 li:first-child').css("background-color", "#f8f8f8")
                    $('#list_Schedule2 li:first-child').css("color", "#c62917")
                    $('#list_Schedule2 li:first-child').css("font-size", "16px")

                    $('#list_Schedule2').append('<li class="extension"><a class="create" id="scheduleAdd">새 시간표 만들기</a></li>')
                    $('#now_Schedule').append('<button id="option_Schedule">설정</button>')
                    readMajorAndCredit();
                    updateCellRe();
                    if(typeof callback=='function'){
                        callback();
                    }
                },
            // <li class="extension"><button id="scheduleAdd" class="extension">새 시간표 만들기</button></li>
                error:function(error){
                    alert("오류가 발생하였습니다.");
                }
            })
        }
        function createSchedule(schedule_name){
            var realScheduleName = schedule_name;
            var url = "<c:url value='/schedule/load?schedule_name=" + realScheduleName + "' />";
            // var atag = '<a href="' + url + '" class="LoadSchedule">' + realScheduleName + '</a>';
            // var atag = '<a href="" class="LoadSchedule" data-info="'+realScheduleName+'">' + realScheduleName + '</a>';
            var li = '<li id="' + realScheduleName + '" class="LoadSchedule">' + realScheduleName + '</li>';
            // var li = '<li id="'+realScheduleName+'">'+realScheduleName+'</li>';
            return li;
        }
        function createHref(schedule_name){
            var realScheduleName = schedule_name;
            var url = "<c:url value='/schedule/load?schedule_name=" + realScheduleName + "' />";
            var input = '<input id="'+realScheduleName+'" readonly=readonly>'+realScheduleName+'</input>'
        }
        function createCredit(sum){
            var credit = sum;
            var li = '<li>'+sum+'학점'+'</li>';
            return li;
        }
        function readMajorAndCredit(){
            // var schedule_name = $('#now_Schedule').html();
            var scheduleHtml = $('#now_Schedule').html();
            var schedule_name = scheduleHtml.split('<')[0];
            var schedule_semester = $('#select_Semester option:selected').text();
            console.log(schedule_name);
            console.log(schedule_semester);
            $.ajax({
                url:"<c:url value='/schedule/readMC'/>",
                type:'post',
                data:{schedule_name : schedule_name,
                schedule_semester:schedule_semester},
                success:function(data){
                    var majorList = data.major;
                    var creditList = data.credit;
                    var sum=0;
                    var majorSum =0;
                    var cultureSum =0;
                    if(data.credit === undefined || data.credit.length === 0){
                        majorSum=0;
                        cultureSum=0;
                        sum=0;
                    }
                    else{
                        for(var i=0; i<creditList.length; i++){
                            sum+=parseInt(creditList[i]);
                        }
                        for(var i=0; i<majorList.length; i++){
                            var cSum = creditList[i];
                            var tmp= majorList[i];
                            if(tmp=='전필')majorSum+=creditList[i];
                            if(tmp=='교양')cultureSum += creditList[i];
                        }
                    }
                    console.log(majorSum);
                    console.log(cultureSum);
                    $('#credit_view').html(sum.toString()+'학점'+'<hr>');
                    $('#credit_view').append(MCSum('전필', majorSum));
                    $('#credit_view').append(MCSum('교양', cultureSum));
                },
                error:function(error){
                    alert("에러 발생"+error);
                }
            })
        }
        function MCSum(major, sum){
            var MC = major;
            var MCsum = sum;
            var tmpID = MC === '전필' || MC === '전선' ? 'major' : 'culture';

            var existingLi = $('#' + tmpID);
            if (existingLi.length > 0) {
                existingLi.text(MC + ': ' + MCsum + '학점');
            } else {
                var li = '<li id="' + tmpID + '">' + MC + ': ' + MCsum + '학점</li>';
                $('#credit_view').append(li);
            }
        }
        function deleteSubject(subject_name, sno) {
            var scheduleHtml = $('#now_Schedule').html();
            var schedule_name = scheduleHtml.split('<')[0];
            var schedule_semester = $('#select_Semester option:selected').text();
            $.ajax({
                url: "<c:url value='/schedule/delete'/>",
                type: "post",
                data: {
                    subject_name: subject_name,
                    sno: sno,
                    schedule_semester : schedule_semester
                },
                success: function(response) {
                    if (response == "possible") {
                        alert("수업 삭제에 성공했습니다.");
                        updateCellRe(schedule_name);
                        readMajorAndCredit();
                    } else {
                        alert("수업 삭제에 실패했습니다.");
                    }
                },
                error: function(error) {
                    alert("시간표 삭제 중 오류가 발생했습니다.");
                }
            });
        }
        function schedule_load(){

        }
        function resetScheduleCells() {
            $('td[id^="mon-"], td[id^="tue-"], td[id^="wed-"], td[id^="tur-"], td[id^="fri-"]').html('').removeAttr('style').show();
            $('td[id^="mon-"][rowspan], td[id^="tue-"][rowspan], td[id^="wed-"][rowspan], td[id^="tur-"][rowspan], td[id^="fri-"][rowspan]').removeAttr('rowspan');
        }
        function LoadSemester(){
            var semester = $('#semesters');
            for(var i=0; i<semesterInteger.length; i++){
                for(var j=0; j<semesterString.length; j++){
                    semester.append(createSemester(semesterInteger[i], semesterString[j]));
                }
            }
        }
        function createSemester(semesterInteger, semesterString){
            var semesters = semesterInteger + " " + semesterString;
            var semester = '<option>'+semesters+'</option>'
            return semester;
        }

    </script>
    </body>
    </html>
