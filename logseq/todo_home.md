## 🎆Immediate #.v-kanban
	- collapsed:: true
	  #+BEGIN_QUERY
	  {:title [:h3 "🔥Past due"]
	   :query [:find (pull ?b [*])
	   :in $ % ?till
	   :where
	     [?b :block/marker ?m]
	     [(contains? #{"LATER" "TODO" "WAITING" "DOING"} ?m)]
	     (or-join [?b ?d]
	       [?b :block/scheduled ?d]
	       [?b :block/deadline ?d]
	              )
	     [(< ?d ?till)]
	     (not 
	         [?descendant :block/parent ?b]
	         [?descendant :block/marker ?am]
	         [(contains? #{"LATER" "TODO" "WAITING" "DOING"}  ?am)]
	      )]
	  :inputs
	      [[[[ancestor ?b ?ancestor]
	  				[?b :block/parent ?ancestor]]
	  				[[ancestor ?b ?ancestor]
	  				[?child :block/parent ?ancestor]
	  				(ancestor ?b ?child)]] :today]
	   
	   :table-view? false
	       :result-transform (fn [result] juxt(map (fn [m] (assoc m :block/collapsed? true)) (sort-by (juxt (fn [r] (get-in r [:block/scheduled])) (fn [r] (get-in r [:block/deadline])) ) result)))  ; Sort first by scheduled and then by deadline, collapse.
	   
	      :breadcrumb-show? false
	      :collapsed? false
	  }
	  #+END_QUERY
	- #+BEGIN_QUERY
	  {:title [:h3 "📅 Next 5 days"]
	   :query [:find (pull ?b [*])
	   :in $ % ?start ?till
	   :where
	     [?b :block/marker ?m]
	     [(contains? #{"LATER" "TODO" "WAITING" "DOING"} ?m)]
	     (or-join [?b ?d]
	       [?b :block/scheduled ?d]
	       [?b :block/deadline ?d]
	              )
	     [(>= ?d ?start)]
	     [(< ?d ?till)]
	     (not 
	         ;; If children are there, show only those - ie., don't show current block if children in pending states exist.
	         ;; This has a problem though. if parent is due in the time frame, but children are due later, then this will
	         ;; show neither parent, nor children. Ideally, in that situation, a parent should be shown with a data issue flag.
	         [?descendant :block/parent ?b]
	         [?descendant :block/marker ?am]
	         [(contains? #{"LATER" "TODO" "WAITING" "DOING"}  ?am)]
	      )]
	  :inputs
	      [[[[ancestor ?b ?ancestor]
	  				[?b :block/parent ?ancestor]]
	  				[[ancestor ?b ?ancestor]
	  				[?child :block/parent ?ancestor]
	  				(ancestor ?b ?child)]] :today :15d-after]
	   
	   :table-view? false
	       :result-transform (fn [result] juxt(map (fn [m] (assoc m :block/collapsed? true)) (sort-by (juxt (fn [r] (get-in r [:block/scheduled])) (fn [r] (get-in r [:block/deadline])) ) result)))  ; Sort first by scheduled and then by deadline, collapse.
	       :breadcrumb-show? false
	      :collapsed? false
	  }
	  #+END_QUERY
- ## 🛠️Upcoming #.v-kanban
	- #+BEGIN_QUERY
	  {:title [:h3 "⏰ Planned"]
	   :query [:find (pull ?b [*])
	   :in $ % ?start
	   :where
	      [?b :block/marker ?m]
	      [(contains? #{"LATER" "TODO" "WAITING" "DOING"} ?m)]
	      (or-join [?b ?d]
	          [?b :block/scheduled ?d]
	       )
	      [(>= ?d ?start)] 
	      (not 
	         [?descendant :block/parent ?b]
	         [?descendant :block/marker ?am]
	         [(contains? #{"LATER" "TODO" "WAITING" "DOING"}  ?am)]
	      )
	    ]
	    :inputs
	      [[[[ancestor ?b ?ancestor]
	  				[?b :block/parent ?ancestor]]
	  				[[ancestor ?b ?ancestor]
	  				[?child :block/parent ?ancestor]
	  				(ancestor ?b ?child)]] :5d-after]
	    :result-transform (fn [result] juxt
	    (
	      map (fn [m] (assoc m :block/collapsed? true)) 
	      (sort-by (juxt 
	          (fn [r] (get-in r [:block/scheduled])) 
	          (fn [r] (get-in r [:block/deadline])) 
	          ) 
	      result))
	    )  ; Sort first by scheduled and then by deadline, collapse. 
	    :table-view? false
	    :breadcrumb-show? false  
	    :collapsed? false
	  }
	  #+END_QUERY
	- #+BEGIN_QUERY
	  {:title [:h3 "🎯 Not yet planned"]
	   :query [:find (pull ?b [*])
	   :in $ ?day
	   :where
	     [?b :block/deadline ?d]
	     [(<= ?d ?day)]
	     [?b :block/marker "TODO"]
	     (not [?b :block/scheduled _])
	  ]
	    :result-transform (fn [result] (sort-by (fn [r] (get-in r [:block/deadline])) result))
	    :breadcrumb-show? false
	    :table-view? false
	   :inputs [:30d-after] 
	  }
	  #+END_QUERY