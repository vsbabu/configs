## 🎆Immediate #.v-kanban
	- #+BEGIN_QUERY
	  {:title [:h3 "🔥Past due"]
	      :query [:find (pull ?h [*])
	              :in $ ?till
	              :where
	              [?h :block/marker ?m]
	              [(contains? #{"LATER" "TODO" "WAITING" "DOING"} ?m)]
	              (or-join [?h ?d]
	                [?h :block/scheduled ?d]
	                [?h :block/deadline ?d]
	              )
	              [(< ?d ?till)]
	              
	      ]
	      :inputs [:today]
	      :table-view? false
	      :result-transform (fn [result] (sort-by 
	       (fn [r] (get-in r [:block/scheduled])) 
	       result)
	      )
	    ; don't show the parent blocks in the result !important, 
	    ; due to result-transform the grouping is lost, and so you will 
	    ; be left with a simple list of TODO items. having 
	    ; those parents blocks mixed in may make the list 
	    ; more confusing. (setting this to true won't show
	    ; the page btw!)
	    :breadcrumb-show? false
	    :collapsed? false
	  }
	  #+END_QUERY
	- #+BEGIN_QUERY
	  {:title [:h3 "📅 Next 5 days"]
	      :query [:find (pull ?h [*])
	              :in $ ?start ?till
	              :where
	              [?h :block/marker ?m]
	              [(contains? #{"LATER" "TODO" "WAITING" "DOING"} ?m)]
	              (or-join [?h ?d]
	                [?h :block/scheduled ?d]
	                [?h :block/deadline ?d]
	              )
	              [(>= ?d ?start)]
	              [(< ?d ?till)]
	              
	      ]
	      :inputs [:today :5d-after]
	      :table-view? false
	      :result-transform (fn [result] (sort-by (fn [r] (get-in r [:block/scheduled])) result)) ;
	      :breadcrumb-show? false
	      :collapsed? false
	  }
	  #+END_QUERY
- ## 🛠️Upcoming #.v-kanban
	- #+BEGIN_QUERY
	  {:title [:h3 "⏰ Planned"]
	   :query [:find (pull ?b [*])
	   :in $ ?start
	   :where
	     [?b :block/marker ?marker]
	     [(contains? #{"TODO" "LATER" "WAITING" "DOING"} ?marker)]  
	     [?b :block/scheduled ?d]  
	     [(>= ?d ?start)] 
	         ;this is to avoid duplicates in next 5d query and here
	    ]
	   :result-transform (fn [result] (
	                 sort-by (
	                      fn [r] (get-in r [:block/scheduled])
	                      ) result
	                 )) 
	   :table-view? false
	   :inputs [:5d-after]
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
	   :inputs [:today+30d] 
	  }
	  #+END_QUERY


